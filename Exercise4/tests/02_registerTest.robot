*** Settings ***
Resource  ../pageObjects/homePage.robot
Resource  ../pageObjects/signInPage.robot
Resource  ../pageObjects/createAccountPage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser
Test Setup  Go To Signin Page

*** Test Cases ***

Register without email
    Create Account  ${SPACE}  MY_strong_PAsword2000
    ${errorMessage}=  Get Create Account Error Message
    Should Contain  ${errorMessage}  Please provide a valid email address

Register without password
    Create Account  someaddress@provider.com
    ${errorMessage}=  Get Create Account Error Message
    Should Contain  ${errorMessage}  Please enter an account password
