*** Settings ***

Resource  ../pageObjects/basePage.robot
Resource  ../pageObjects/SignIn.robot


Suite Setup  Open My Website
Test Setup  Maximize Browser Window
Suite Teardown  Close browser
Library  SeleniumLibrary


*** Variables ***

${foutmelding}=     xpath://div[@class='css-1y9e552']/code
${signOutButton}=  xpath://*[@id="SignOutButton"]


*** Test Cases ***

Na het inloggen, kom je op de juiste pagina terecht

    Login With Account
    Page Should Contain Element  ${signOutButton}
    Sleep  2s
    Click Element  ${signOutButton}


Foutief inloggen geef een feedback voor foute paswoord

    Login False Password
    Element Text Should Be    ${foutmelding}  Email or password incorrect.


Foutief inloggen geef een feedback voor foute username

    Login False Email
    Element Text Should Be  ${foutmelding}  Please fill in a correct email-adress.


