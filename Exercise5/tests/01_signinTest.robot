*** Settings ***
Resource  ../pageObjects/basePage.robot


Suite Setup  Open My Website
Suite Teardown  Close browser


*** Test Cases ***

Eerste test case
    Wait Until Element Is Visible  css:#username
    Input Text  css:#username   tomsmith
    Input Text  css:#password   incorrectPassword
    Click Element    //i[@class='fa fa-2x fa-sign-in']
    Element Should Contain    css:#flash    Your password is invalid!


Tweede test case
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tom
    Input Text    css:#password     incorrectPassword
    Click Element    //i[@class='fa fa-2x fa-sign-in']
    Element Should Contain    css:#flash    Your username is invalid!


Derde test case
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tomsmith
    Input Text    css:#password     SuperSecretPassword!
    Click Element    //i[@class='fa fa-2x fa-sign-in']
    Element Should Contain    css:#flash    You logged into a secure area!


Vierde test case
    Go To  https://the-internet.herokuapp.com/login
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tomsmith
    Input Text    css:#password     SuperSecretPassword!
    Click Element    //i[@class='fa fa-2x fa-sign-in']
    Click Element    //i[@class='icon-2x icon-signout']
    Element Should Contain    css:div[class='example']    Login Page









