*** Settings ***
Resource  basePage.robot

*** Variables ***
${ABOUTUS}=           xpath://*[@id="about"]/ul[1]/li[4]/a
${ABOUTUS_TXT}=       xpath://p[contains(text(),'onafhankelijke expert')]

*** Keywords ***

Go To About Us
    Click Link  ${ABOUTUS}
    Wait Until Element Is Visible  ${ABOUTUS_TXT}

Get About Us Text
    ${text}=  Get Text  ${ABOUTUS_TXT}
    [Return]  ${text}
