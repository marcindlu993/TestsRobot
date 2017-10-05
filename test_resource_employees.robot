*** Settings ***
Documentation  Test of CRUD Employees

Library  Selenium2Library
Resource  resources.robot
Suite Teardown  Close browser

*** Test Cases ***
Test Resource Employees
    Open browser to login page
    Login to site
    Open location employees
    :FOR  ${x}  IN RANGE  1  3
    \  Add new employee
    :FOR  ${Q}  IN RANGE  1  3
    \  Delete new employee
    Update employee  Dlug
    Update employee  Clinton

*** Keywords ***
Open Location Employees
    Click element  css=#bs-example-navbar-collapse-1 > ul > li:nth-child(2) > a
    Location should be  ${SERVER}/#!/Employee

Add New Employee
    Click element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.row > div.col-sm-2.col-xs-7 > button
    Wait until element is visible  id=myModal
    Input text  css=#myModal > div > div > div.modal-body > div > input:nth-child(3)  Kamil
    Input text  css=#myModal > div > div > div.modal-body > div > input:nth-child(5)  Dlug
    Input text  css=#myModal > div > div > div.modal-body > div > input:nth-child(7)  net
    Input text  css=#myModal > div > div > div.modal-body > div > input:nth-child(9)  dev
    Input text  css=#myModal > div > div > div.modal-body > div > input:nth-child(11)  1
    Click element  css=#myModal > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Delete New Employee
    Click button  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-12 > table > tbody > tr > td:nth-child(6) > button
    Wait until element is visible  id=confirmDelete
    Click button  css=#confirmDelete > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Update Employee
    [Arguments]  ${surname}
    Click element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-12 > table > tbody > tr > td:nth-child(7) > button
    wait until element is visible  id=myModalUpdate
#    Sleep  1
    Input text  xpath=//*[@id="myModalUpdate"]/div/div/div[1]/div/input[3]  ${surname}
    Click button  css=#myModalUpdate > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3