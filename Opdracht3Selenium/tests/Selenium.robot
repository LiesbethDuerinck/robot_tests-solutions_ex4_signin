*** Settings ***
Resource  ../pageObjects/basePage.robot


Suite Setup  Open My Website
Suite Teardown  Close browser


*** Test Cases ***

De zoekbalk helpt om een film op te zoeken



Je kan horizontaal door genres scrollen



Een profiel heeft een foto
    Sleep  4s
    Maximize Browser Window
    Sleep  3s
    Wait Until Element Is Visible  css:#SignInButton
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  5s
    Click Element  css:#OrdersPageButton.css-17ylx6u
    Sleep  2s
    Page Should Contain Image  css:.css-1wu7nrr


Een profiel toont de correcte voor- en achternaam

De zoekbalk vult resultaten aan

Inloggen geeft juiste feedback (meerdere cases)

Na het inloggen, kom je op de juiste pagina terecht

Na het huren van een film, komt het in de lijst met gehuurde films

Na het huren van een film, dalen de credits met de juiste waarde

Negatieve credits kunnen aangekocht worden