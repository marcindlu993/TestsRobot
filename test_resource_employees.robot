*** Settings ***
Documentation  Test of CRUD Employees

Library  Selenium2Library
Resource  resources.robot

*** Keywords ***
Test Resource Employees
    Login To Site
    Open Location Employees
    :FOR  ${x}  IN RANGE  1  5
    \  Add New Employee
    :FOR  ${Q}  IN RANGE  1  5
    \  Delete New Employee
    Update Employee  Dlug
    Update Employee  Clinton

Open Location Employees
    Click Element  css=#bs-example-navbar-collapse-1 > ul > li:nth-child(2) > a
    Location Should Be  ${SERVER}/#!/Employee

Add New Employee
    Click Element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.row > div.col-sm-2.col-xs-7 > button
    wait until element is visible  css=#myModal
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(3)  Kamil
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(5)  Dlug
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(7)  net
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(9)  dev
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(11)  1
    Click Element  css=#myModal > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Delete New Employee
    Click Button  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-12 > table > tbody:nth-child(3) > tr > td:nth-child(6) > button
    Wait Until Element Is Visible  css=#confirmDelete
    Click Button  css=#confirmDelete > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Update Employee
    [Arguments]  ${surname}
    Click Element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-12 > table > tbody > tr > td:nth-child(7) > button
#    wait until element is visible  css=#myModalUpdate
    Sleep  1
    Input Text  xpath=//*[@id="myModalUpdate"]/div/div/div[1]/div/input[3]  ${surname}
    Click Button  css=#myModalUpdate > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3