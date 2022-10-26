*** Settings ***

Resource  ../pageObjects/basePage.robot
Resource   ../pageObjects/SignIn.robot


Suite Setup  Open My Website
Test Setup  Maximize Browser Window
Suite Teardown  Close browser
Library  SeleniumLibrary


*** Variables ***

${zoekbalk}=  xpath:/html/body/div/div/div[2]/header/div[2]/div/div/div/div
${inputSearchBar}=  xpath:/html/body/div/div/div[2]/header/div[2]/div/div/div/div/input
${fullTitle}=  Clouds
${firstChar}=  Clo
${firstOption}=  xpath:/html[1]/body[1]/div[2]/div[1]/ul[1]/li[1]


*** Test Cases ***

De zoekbalk vult resultaten aan

    Sleep  7s
    Click Element   ${zoekbalk}
    Sleep  2s
    Input Text    ${inputSearchBar}  ${firstChar}
    Sleep  2s
    Element Should Contain  ${firstOption}   ${fullTitle}


De zoekbalk helpt om een film op te zoeken

    Sleep  7s
    Click Element   ${zoekbalk}
    Sleep  2s
    Input Text  ${inputSearchBar}  Sput
    Sleep  2s
    Click Element  ${firstOption}
    Element Should Be Visible  xpath:/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/button



