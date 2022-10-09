*** Settings ***
Resource  ../pageObjects/basePage.robot


Suite Setup  Open My Website
Suite Teardown  Close browser


*** Test Cases ***

Een profiel toont de correcte voor- en achternaam

    Sleep  2s
    Maximize Browser Window
    Sleep  2s
    Wait Until Element is Visible  css:#SignInButton
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Click Element  css:#OrdersPageButton.css-17ylx6u
    Page Should Contain  FIRSTNAME: Liesbeth
    Page Should Contain  LASTNAME: Duerinck
    Sleep  2s

Inloggen geeft de juiste feedback (meerdere cases)

    Sleep  2s
    Maximize Browser Window
    Sleep  2s
    Wait Until Element is Visible  css:#SignInButton
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Page Should Contain  Sign Out
    Sleep  2s

Na het inloggen, kom je op de juiste pagina terecht

    Sleep  2s
    Maximize Browser Window
    Sleep  2s
    Wait Until Element is Visible  css:#SignInButton
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Page Should Contain  Sign Out
    Sleep  2s

Na het huren van een film, komt het in de lijst met gehuurde films

    Sleep  2s
    Click Element  css:#button#OrdersPageButton.css-17ylx6u
    Sleep  2s
    Click Element  css:.css-1e9674f
    Input Text  css:input[placeholder='5']  100
    Click Element  css:button[type='submit']
    Click Element  css:#Logo
    Sleep  2s
    Click Element  css:#img#52172.css-pcr5dh
    Sleep  2s
    Click Element  css:#RentMovieButton
    Sleep  4s
    Click Element  css:#button#OrdersPageButton.css-e6lyw
    Page Should Contain  Happiest Season
    Sleep  2s

Na het huren van een film, dalen de credits met de juiste waarde

    Click Element  css:#OrdersPageButton.css-17ylx6u
    Sleep  2s
    Page Should Contain  CREDITS: 97
    Sleep  2s

Negatieve credits kunnen niet aangekocht worden

    Click Element  css:#OrdersPageButton.css-17ylx6u
    Sleep  2s
    Click Element  css:.css-1e9674f
    Input Text  input[placeholder='5']  -5
    Click Element  button[type='submit']
    Page Should Contain  Waarde moet groter dan of gelijk zijn aan 1.
    Sleep  2s

Een profiel heeft een avatar

De zoekbalk helpt op een film te zoeken

Je kan horizontaal door genres scrollen

De zoekbalk vult resultaten aan

