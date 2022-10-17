*** Settings ***

Resource  ../pageObjects/basePage.robot



Suite Setup  Open My Website
Test Setup  Maximize Browser Window
Test Teardown  Click Element  //*[@id="SignOutButton"]
Suite Teardown  Close browser


*** Test Cases ***

Na het inloggen, kom je op de juiste pagina terecht

    Sleep  4s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Page Should Contain Element  //*[@id="SignOutButton"]

Een profiel toont de correcte voor- en achternaam

    Sleep  4s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Sleep  2s
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Click Element  xpath://*[@id="nav"]/div[4]/a[2]
    Sleep  2s
    ${firstname}=  Get Text  xpath://p[2]
    Should Be Equal  ${firstname}  Liesbeth
    Element text Should Be  //div[@class='css-kcntxh']/p[@class='css-cpr2ex'][1]  Duerinck


Een profiel heeft een avatar

    Sleep  14s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Click Element  xpath://*[@id="nav"]/div[4]/a[2]
    Element Should Be Visible  xpath://*[@id="SignIn"]/div[3]/img


Foutief inloggen geef een feedback voor foute paswoord

    Sleep  6s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  FoutWW
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Element Text Should Be  //div[@class='css-1y9e552']/code  Email or password incorrect.

Foutief inloggen geef een feedback voor foute username

    Sleep  6s
    Click Element  css:#SignInButton
    Sleep  2s
    Input Text  css:#SignInEmail  liesbeth.duerinck
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Element Text Should Be  //div[@class='css-1y9e552']/code  Please fill in a correct email-adress.


Na het huren van een film, dalen de credits met de juiste waarde

    Sleep  5s
    Click Element  css:#SignInButton
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Click Image  xpath://*[@id="734280"]
    Sleep  2s
    Click Element  css:#RentMovieButton
    Sleep  10s
    Go To  https://brightshopapp.herokuapp.com/#/profile
    Sleep  2s
    Element Should Contain  xpath://*[@id="SignIn"]/div[3]/p[6]     87


Na het huren van een film, komt het in de lijst met gehuurde films

    Sleep  5s
    Click Element  css:#SignInButton
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Click Element    xpath://div[@id='Action Movies']//img[@id='722603']
    Sleep  5s
    Click Element    xpath://button[@id='RentMovieButton']
    Sleep  5s
    Go To  https://brightshopapp.herokuapp.com/#/orders
    Sleep  5s
    Element Should Contain    xpath://*[@id="root"]/div/div[2]/div[3]/div  BATTLEFIELD

Negatieve credits kunnen niet aangekocht worden

    Sleep  5s
    Click Element  css:#SignInButton
    Input Text  css:#SignInEmail  liesbeth_duerinck@hotmail.com
    Input Text  css:#SignInPassword  Sterk123
    Click Element  css:#SignInButtonComplete
    Sleep  2s
    Go To  https://brightshopapp.herokuapp.com/#/profile
    Click Element  xpath://*[@id="SignIn"]/div[3]/button
    Sleep  2s
    Click Element  xpath://*[@id="SignIn"]/div[3]/div[2]/div/form/input
    Input Text  xpath://*[@id="SignIn"]/div[3]/div[2]/div/form/input  -10
    Sleep  2s
    Click Element  xpath://*[@id="SignIn"]/div[3]/div[2]/div/form/button
    Element Should Contain  xpath://*[@id="SignIn"]/div[3]/p[6]     75

De zoekbalk helpt om een film op te zoeken

    Sleep  5s
    Click Element  xpath://*[@id="mui-67075"]
    Input Text  xpath://*[@id="mui-67075"]  Clo


De zoekbalk vult resultaten aan
























