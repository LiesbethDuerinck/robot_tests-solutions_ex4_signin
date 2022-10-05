*** Settings ***
Resource            ../pageObjects/basePage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***

*** Test Cases ***

Selenium Test Locate And Interact And Verify
    Click Element  xpath://*[@id="koekieBar"]/div[1]/div[2]/button[1]
    ${text}=  Get Text  xpath://a[@class='smartphones']
    Should Contain  ${text}  Beste


