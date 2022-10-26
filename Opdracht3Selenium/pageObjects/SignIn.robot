*** Settings ***

Resource            basePage.robot
Resource            homePage.robot

***Variables***




*** Keywords ***

Login With Account
    Sleep  5s
    Click Element  css:#SignInButton
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s


Login False Password
    Sleep  6s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  FoutWW
    Click Element  css:#SignInButtonComplete
    Sleep  2s


Login False Email
    Sleep  6s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth.duerinck
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
