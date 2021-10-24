*** Settings ***
Documentation   Fill form on url: http://www.practiceselenium.com/practice-form.html
Resource    form_fill.robot
Library    mails.py
Resource    PDF_Creation.robot


*** Tasks ***
My Main Task
    Open The Website
    ${teas}=  Create List  Black Tea  Oolong Tea
    ${list_commands}=    Create List  Wait Commands  Switch Commands
    ${content}=  Enter Data Into Website    Devashish    Nigam    male    Asia    ${teas}  ${list_commands}
    Dump HTML Content To PDF    ${content}
    Send Status Mail  devashish.nigam89@gmail.com  thyanchor@gmail.com  Status Email  <p>Hello World!</p>  %{ROBOT_ROOT}/output.pdf
    Close The Browser
