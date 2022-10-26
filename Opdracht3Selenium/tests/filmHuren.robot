*** Settings ***

Resource  ../pageObjects/basePage.robot
Resource  ../pageObjects/SignIn.robot


Suite Setup  Open My Website
Test Setup  Maximize Browser Window
Suite Teardown  Close browser
Library  SeleniumLibrary


*** Variables ***

${SELECT_MOVIE}=  xpath://div[@id='Action Movies']//img[@id='722603']
${HIRE_BUTTON}=  xpath://button[@id='RentMovieButton']


*** Test Cases ***

Na het huren van een film, komt het in de lijst met gehuurde films

    Log In With Account
    Sleep  2s
    Click Element    ${SELECT_MOVIE}
    Sleep  2s
    Click Element    ${HIRE_BUTTON}
    Sleep  2s
    Go To  https://brightshopapp.herokuapp.com/#/orders
    Sleep  2s
    Element Should Contain    xpath://*[@id="root"]/div/div[2]/div[3]/div  BATTLEFIELD


