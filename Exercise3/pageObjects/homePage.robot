*** Settings ***
Resource  basePage.robot

*** Variables ***
${ACCEPT_COOKIES}=    xpath://*[@id="koekieBar"]/div[1]/div[2]/button[1]
${PHONES}=       xpath://a[@class='smartphones']

*** Keywords ***

Go To Home
    Click Element  ${ACCEPT_COOKIES}
    Wait Until Element Is Not Visible  ${ACCEPT_COOKIES}

Get Smartphones text
    Wait Until Element Is Visible  ${PHONES}
    ${text}=  Get Text  ${PHONES}
    [Return]  ${text}
