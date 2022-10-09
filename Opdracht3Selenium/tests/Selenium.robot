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

Na het inloggen, kom je op de juiste pagina terecht

Na het huren van een film, komt het in de lijst met gehuurde films

Na het huren van een film, dalen de credits met de juiste waarde

Negatieve credits kunnen niet aangekocht worden

Een profiel heeft een avatar

De zoekbalk helpt op een film te zoeken

Je kan horizontaal door genres scrollen

De zoekbalk vult resultaten aan

