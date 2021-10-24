*** Settings ***
Library    RPA.PDF

*** Keywords ***
Dump HTML Content To PDF
    [Arguments]  ${html_content}
    LOG  ${CURDIR}
    LOG  %{ROBOT_ROOT}
    Html To Pdf    ${html_content}  %{ROBOT_ROOT}/output.pdf
