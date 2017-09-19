*** Settings ***
Documentation  Test of CRUD Employees

Library  Selenium2Library
Resource  resources.robot

*** Keywords ***
Test Resource Employees
    Login To Site
    Open Location Employees
    Add New Employee
    Delete New Employee

Login To Site
#    Open Browser To Login Page
    Login Site  Marcin  Qwerty12!

Open Location Employees
    Click Element  css=#bs-example-navbar-collapse-1 > ul > li:nth-child(2) > a
    Location Should Be  ${SERVER}/#!/Employee

Add New Employee
    Click Element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.row > div.col-sm-2.col-xs-7 > button
    Sleep  0.5
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(3)  Kamil
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(5)  Dlug
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(7)  net
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(9)  dev
    Input Text  css=#myModal > div > div > div.modal-body > div > input:nth-child(11)  1
    Click Element  css=#myModal > div > div > div.modal-footer > button.btn.btn-primary.btn-default

Delete New Employee
    Sleep  0.5
    Click Button  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-12 > table > tbody:nth-child(3) > tr > td:nth-child(6) > button
    Sleep  0.5
    Click Button  css=#confirmDelete > div > div > div.modal-footer > button.btn.btn-primary.btn-default
