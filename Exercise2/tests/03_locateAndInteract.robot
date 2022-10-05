*** Settings ***
Resource            ../pageObjects/basePage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***

*** Test Cases ***

Selenium Test Locate And Interact
    Click Element  xpath://*[@id="koekieBar"]/div[1]/div[2]/button[1]
    Sleep  5s

Selenium Test Locate And Interact True
    Click Element  css:#true
    Sleep  5s

