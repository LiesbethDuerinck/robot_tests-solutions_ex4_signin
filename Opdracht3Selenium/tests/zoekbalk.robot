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
${fullTitle1}=  Clouds
${firstChar1}=  Clo
${fullTitle2}=  Baba Yaga: Terror of the Dark Forest
${firstChar2}=  dark
${firstOption}=  xpath:/html[1]/body[1]/div[2]/div[1]/ul[1]/li[1]


*** Test Cases ***

De zoekbalk vult resultaten aan

    Sleep  7s
    Click Element   ${zoekbalk}
    Sleep  2s
    Input Text    ${inputSearchBar}  ${firstChar1}
    Sleep  2s
    Element Should Contain  ${firstOption}   ${fullTitle1}


De zoekbalk helpt om een film op te zoeken

    Sleep  7s
    Click Element   ${zoekbalk}
    Sleep  2s
    Input Text  ${inputSearchBar}  ${firstChar2}
    Sleep  2s
    Element Should Contain  ${firstOption}  ${fullTitle2}



