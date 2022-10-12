*** Settings ***
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


Een profiel heeft een avatar

    Sleep  4s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Click Element  css:#OrdersPageButton
    Page Should Contain  css:#SignIn > div.css-kcntxh > img




