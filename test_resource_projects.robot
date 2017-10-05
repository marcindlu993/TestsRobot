*** Settings ***
Documentation  Test of CRUD Employees

Library  Selenium2Library
Resource  resources.robot
Library  Collections
Library  String
Suite Teardown  Close browser

*** Test Cases ***
Test Resource Projects
    Open browser to login page
    Login to site
    ${projectNames}=  Create List  project1  project2  project3  project4
    Open location projects
    :FOR  ${x}  IN  ${projectNames}
    \  Add New Project  ${x}
    :FOR  ${x}  IN RANGE  1  2
    \  Delete New Project
    Update project  things
    Update project  something things

*** Keywords ***
Open Location Projects
    Click element  css=#bs-example-navbar-collapse-1 > ul > li:nth-child(3) > a
    Location should be  ${SERVER}/#!/Project

Add New Project
    [Arguments]  ${projectName}
    Click element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.row > div.col-sm-2.col-xs-7 > button
    Wait until element is visible  id=myModalAdd

    Input text  css=#myModalAdd > div > div > div.modal-body > div > input:nth-child(3)  ${projectName}
    Input text  css=#myModalAdd > div > div > div.modal-body > div > input:nth-child(5)  new project for test you see what i told you
    Click button  css=#myModalAdd > div > div > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Delete New Project
    Sleep  0.5
    Click button  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-11 > table > tbody > tr:nth-child(1) > td:nth-child(4) > button
    Wait until element is visible  css=#confirmDelete > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3
    Click button  css=#confirmDelete > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Update Project
    [Arguments]  ${name}
    Click button  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-11 > table > tbody > tr:nth-child(1) > td:nth-child(5) > button
    Wait until element is visible  id=myModalUpdate
    Input text  //*[@id="myModalUpdate"]/div/div/div/div/input[3]  ${name}
    Click button  css=#myModalUpdate > div > div > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3