*** Settings ***
Library    RPA.Browser.Playwright
Library    String

# +
*** Keywords ***
Open The Website
    New Browser  chromium  headless=False
    Set Browser Timeout    30
    ${C1}=  New Context  acceptDownloads=True  ignoreHTTPSErrors=True  viewport={'width': 1920, 'height': 1080}
    LOG  ${C1}
    New Page  http://www.practiceselenium.com/practice-form.html
Enter Data Into Website
    [Arguments]  ${fname}  ${lname}  ${gender}  ${continent}  ${list_teas}  ${list_commands}
    Type Text    xpath=//input[@name='firstname']    ${fname}
    Type Text    xpath=//input[@name='lastname']    ${lname}
    ${gender}=  Convert To Lower Case  ${gender}
    LOG  ${gender}
    Run Keyword If  "${gender}" == "male"  
    ...    Click  xpath=//input[@id='sex-0']
    ...  ELSE
    ...    Click  xpath=//input[@id='sex-1']
    
    FOR    ${tea}    IN    @{list_teas}
        Run Keyword If    "${tea}" == "Black Tea"
    ...    Click  xpath=//input[@id='tea1']
    ...  ELSE IF    "${tea}" == "Red Tea"
    ...    Click  xpath=//input[@id='tea2']
    ...  ELSE
    ...    Click  xpath=//input[@id='tea3']
    END
    Select Options By    xpath=//select[@id='continents']    text    Asia
   
    Select Options By    xpath=//select[@id='selenium_commands']    text    @{list_commands}
    Sleep  2
    Click    xpath=//button[@id='submit']
    Sleep    3  
    ${html_content}=  Execute JavaScript  document.querySelector("body > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(9) > div:nth-child(1)").outerHTML
    LOG  ${html_content}
    Sleep    1
    [Return]  ${html_content}
    
Close The Browser
    Close Browser
