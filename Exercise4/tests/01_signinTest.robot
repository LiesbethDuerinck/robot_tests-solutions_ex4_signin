*** Settings ***
Resource  ../pageObjects/homePage.robot
Resource  ../pageObjects/signInPage.robot

Suite Setup  Open My Website

*** Test Cases ***
Login Without Email Address
    Sleep  2s
    Click Element  css:#menu-icon
    Sleep  2s
    Click Element  css:a[href='https://practice.automationtesting.in/my-account/']
    Sleep  10s
    Input Text  css:#password  dlsl
    Sleep  1s
    Click Button  css:input[value='Login']
    Sleep  1s
    Element Text Should Be  ul[class='woocommerce-error'] li  Error: Username is required

