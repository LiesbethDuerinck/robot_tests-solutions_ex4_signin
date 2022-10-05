*** Settings ***
Resource  ../pageObjects/basePage.robot
Resource  ../pageObjects/homePage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***

*** Test Cases ***

Test Home Page Contains Expected Text
    Go To Home
    ${text}=  Get Smartphones text
    Should Contain  ${text}  Beste smartphones

