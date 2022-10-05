*** Settings ***
Resource  ../pageObjects/homePage.robot
Resource  ../pageObjects/signInPage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser
Test Setup  Go To Signin Page

*** Test Cases ***

Eerste test case
    Open My Website
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tomsmith
    Input Text    css:#password     incorrectPassword
    Click Element    //i[@class='fa fa-2x fa-sign-in']
    Element Should Contain    css:#flash    Your password is invalid!
    Close Browser

Tweede test case
    Open My Website
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tom
    Input Text    css:#password     incorrectPassword
    Click Element    //i[@class='fa fa-2x fa-sign-in']
    Element Should Contain    css:#flash    Your username is invalid!
    Close Browser

Derde test case
    Open My Website
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tomsmith
    Input Text    css:#password     SuperSecretPassword!
    Click Element    //i[@class='fa fa-2x fa-sign-in']
    Element Should Contain    css:#flash    You logged into a secure area!
    Close Browser

Vierde test case
    Open My Website
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tomsmith
    Input Text    css:#password     SuperSecretPassword!
    Click Element    //i[@class='fa fa-2x fa-sign-in']
    Click Element    //i[@class='icon-2x icon-signout']
    Element Should Contain    css:div[class='example']    Login Page
    Close Browser








