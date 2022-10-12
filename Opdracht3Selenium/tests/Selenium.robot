*** Settings ***
Library  SeleniumLibrary
Resource  ../pageObjects/basePage.robot



Suite Setup  Open My Website
Test Setup  Maximize Browser Window
Test Teardown  Click Element  //*[@id="SignOutButton"]
Suite Teardown  Close browser


*** Test Cases ***
Inloggen geeft de juiste feedback (meerdere cases) PASS

    Sleep  4s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Page Should Contain Element  //*[@id="SignOutButton"]
    Sleep  2s


Na het inloggen, kom je op de juiste pagina terecht PASS

    Sleep  4s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Page Should Contain Element  //*[@id="SignOutButton"]

Een profiel toont de correcte voor- en achternaam

    Sleep  4s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Sleep  2s
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Click Element  xpath://*[@id="nav"]/div[4]/a[2]
    Sleep  2s
    ${firstname}=  Get Text  xpath://p[2]
    Should Be Equal  ${firstname}  Liesbeth
    Sleep  5s

Een profiel heeft een avatar

    Sleep  14s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Click Element  xpath://*[@id="nav"]/div[4]/a[2]
    Element Should Be Visible  xpath://*[@id="SignIn"]/div[3]/img


