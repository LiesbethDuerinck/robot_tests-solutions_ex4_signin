*** Settings ***

Resource  ../pageObjects/basePage.robot
Resource   ../pageObjects/signIn.robot



Suite Setup  Open My Website
Test Setup  Maximize Browser Window
Test Teardown  Click Element  //*[@id="SignOutButton"]
Suite Teardown  Close browser
Library  SeleniumLibrary


*** Variables ***

${addCredits}=  xpath://*[@id="SignIn"]/div[3]/button
${buyButton}=  xpath://*[@id="SignIn"]/div[3]/div[2]/div/form/button
${inputCredits}=  xpath://*[@id="SignIn"]/div[3]/div[2]/div/form/input
${amountOfCredits}=  xpath://*[@id="SignIn"]/div[3]/p[6]
${movieOfChoice}=  xpath://*[@id="734280"]
${RentThisMovieButton}=  css:#RentMovieButton


*** Test Cases ***

Negatieve credits kunnen niet aangekocht worden

    Login With Account
    Go To  https://brightshopapp.herokuapp.com/#/profile
    Click Element  ${addCredits}
    Sleep  2s
    Click Element  ${inputCredits}
    Input Text  ${inputCredits}  -10
    Sleep  2s
    Click Element  ${buyButton}
    Element Should Contain   ${amountOfCredits}    75


Na het huren van een film, dalen de credits met de juiste waarde

    Login With Account
    Click Image  ${movieOfChoice}
    Sleep  2s
    Click Element  ${RentThisMovieButton}
    Sleep  10s
    Go To  https://brightshopapp.herokuapp.com/#/profile
    Sleep  2s
    Element Should Contain  ${amountOfCredits}     75



