*** Settings ***
Documentation  Test of CRUD Employees

Library  Selenium2Library
Resource  resources.robot
Library  Collections
Library  String

*** Keywords ***
${projectNames}=  Create List  project1  project2  project3  project4

Test Resource Projects
    ${projectNames}=  Create List  project1  project2  project3  project4
    Open Location Projects
    :FOR  ${x}  IN  ${projectNames}
    \  Add New Project  ${x}
    :FOR  ${x}  IN RANGE  1  2
    \  Delete New Project
    Update Project  things
    Update Project  something things

Open Location Projects
    Click Element  css=#bs-example-navbar-collapse-1 > ul > li:nth-child(3) > a
    Location Should Be  ${SERVER}/#!/Project

Add New Project
    [arguments]  ${projectName}
    Click Element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.row > div.col-sm-2.col-xs-7 > button
    wait until element is visible  css=#myModalAdd

    Input Text  css=#myModalAdd > div > div > div.modal-body > div > input:nth-child(3)  ${projectName}
    Input Text  css=#myModalAdd > div > div > div.modal-body > div > input:nth-child(5)  new project for test you see what i told you
    Click Button  css=#myModalAdd > div > div > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Delete New Project
    sleep  0.5
    Click Button  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-11 > table > tbody > tr:nth-child(1) > td:nth-child(4) > button
    Wait Until Element Is Visible  css=#confirmDelete > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    sleep  0.3
    Click Button  css=#confirmDelete > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3


Update Project
    [Arguments]  ${name}
    Click Button  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-11 > table > tbody > tr:nth-child(1) > td:nth-child(5) > button
    wait until element is visible  css=#myModalUpdate
    Input Text  //*[@id="myModalUpdate"]/div/div/div/div/input[3]  ${name}
    Click Button  css=#myModalUpdate > div > div > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3