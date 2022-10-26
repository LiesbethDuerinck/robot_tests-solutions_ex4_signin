*** Settings ***

Resource  ../pageObjects/basePage.robot
Resource  ../pageObjects/SignIn.robot


Suite Setup  Open My Website
Test Setup  Maximize Browser Window
Test Teardown  Click Element  //*[@id="SignOutButton"]
Suite Teardown  Close browser
Library  SeleniumLibrary


*** Variables ***

${avatar}=  xpath://*[@id="SignIn"]/div[3]/img
${profileButton}=  xpath://*[@id="nav"]/div[4]/a[2]
${lastName}=  //div[@class='css-kcntxh']/p[@class='css-cpr2ex'][1]
${FIRSTNAME}=  xpath://p[2]


*** Test Cases ***


Een profiel toont de correcte voor- en achternaam

    Login With Account
    Click Element  ${profileButton}
    Sleep  2s
    ${firstname}=  Get Text  ${FIRSTNAME}
    Should Be Equal  ${firstname}  Liesbeth
    Element text Should Be  ${lastName}  Duerinck


Een profiel heeft een avatar

    Login With Account
    Click Element  ${profileButton}
    Element Should Be Visible  ${avatar}

