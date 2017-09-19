*** Settings ***
Documentation  Test of my broken app for billenium

Library  Selenium2Library

*** Variables ***
${BROWSER}  chrome
${SERVER}  http://127.0.0.1:8080
${LOGIN URL}  ${SERVER}/#!/signInView

*** Keywords ***
Open Browser To Login Page
    Open Browser  ${SERVER}  ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be  ${LOGIN URL}

Login Site
    [Arguments]  ${username}  ${password}
    Input Text  id=exampleInputEmail2  ${username}
    Input Text  id=exampleInputPassword2  ${password}
    Click Button  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-md-offset-4.ng-scope > form > button
    Sleep  0.1

Timesheet Location Should Be Open
    Location Should Be  ${SERVER}/#!/Timesheet

Logout
    Click Element  css=#navbar-menu-right > li.dropdown > a
    Click Element  css=#navbar-menu-right > li.dropdown.open > ul > li:nth-child(1) > a

Signin Location Should Be Open
    Location Should Be  ${SERVER}/#!/signInView
