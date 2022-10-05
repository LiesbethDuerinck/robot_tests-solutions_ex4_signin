*** Settings ***
Resource  ../pageObjects/homePage.robot
Resource  ../pageObjects/signInPage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser
Test Setup  Go To Signin Page

*** Test Cases ***

Eerste test case
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tomsmith
    Input Text    css:#password     incorrectPassword
    Click Element    css:.fa.fa-2x.fa-sign-in
    Element Should Contain    css:#flash    Your password is invalid!
    Sleep  1s

Tweede test case
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tom
    Input Text    css:#password     incorrectPassword
    Click Element    css:.fa.fa-2x.fa-sign-in
    Element Should Contain    css:#flash    Your username is invalid!
    Sleep  1s

Derde test case
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tomsmith
    Input Text    css:#password     SuperSecretPassword!
    Click Element    css:.fa.fa-2x.fa-sign-in
    Element Should Contain    css:#flash    You logged into a secure area!
    Sleep  1s
    Go To    http://the-internet.herokuapp.com/login

Vierde test case
    Wait Until Element Is Visible    css:#username
    Input Text    css:#username     tomsmith
    Input Text    css:#password     SuperSecretPassword!
    Click Element    css:.fa.fa-2x.fa-sign-in
    Click Element    css:.icon-2x.icon-signout
    Element Should Contain    css:div[class='example']    Login Page
    Sleep  1s








