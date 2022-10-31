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
${movieOfChoice}=  xpath://*[@id="531219"]
${RentThisMovieButton}=  css:#RentMovieButton
${creditAmount}=  xpath://*[@id="SignIn"]/div[3]/p[6]


*** Test Cases ***



Na het huren van een film, dalen de credits met de juiste waarde

    Login With Account
    Go To  https://brightshopapp.herokuapp.com/#/profile
    ${creditsBeforeBuy}  Get Value  ${creditAmount}
    Go To  https://brightshopapp.herokuapp.com/#/
    Sleep  2s
    Click Image  ${movieOfChoice}
    Sleep  2s
    Click Element  ${RentThisMovieButton}
    Sleep  10s
    Go To  https://brightshopapp.herokuapp.com/#/profile
    Sleep  2s
    ${creditsAfterBuy}  Get Value  ${creditAmount}
    Should Be Equal  ${creditsBeforeBuy}  ${creditsAfterBuy}


Negatieve credits kunnen niet aangekocht worden

    Login With Account
    Go To  https://brightshopapp.herokuapp.com/#/profile
    ${creditsBeforeBuy}  Get Value  ${creditAmount}
    Click Element  ${addCredits}
    Sleep  2s
    Click Element  ${inputCredits}
    Sleep  5s
    Input Text  ${inputCredits}  -10
    Sleep  2s
    Click Element  ${buyButton}
    ${creditsAfterBuy}  Get Value  ${creditAmount}
    Should Be Equal  ${creditsBeforeBuy}  ${creditsAfterBuy}


