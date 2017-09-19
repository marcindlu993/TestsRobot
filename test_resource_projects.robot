*** Settings ***
Documentation  Test of CRUD Employees

Library  Selenium2Library
Resource  resources.robot

*** Keywords ***
Test Resource Projects
    Open Location Projects
    :FOR  ${x}  IN RANGE  1  5
    \  Add New Project
    :FOR  ${Q}  IN RANGE  1  5
    \  Delete New Project
    Update Project  things
    Update Project  something things

Open Location Projects
    Click Element  css=#bs-example-navbar-collapse-1 > ul > li:nth-child(3) > a
    Location Should Be  ${SERVER}/#!/Project

Add New Project
    Click Element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.row > div.col-sm-2.col-xs-7 > button
    wait until element is visible  css=#myModalAdd
    Input Text  css=#myModalAdd > div > div > div.modal-body > div > input:nth-child(3)  NewProject for test
    Input Text  css=#myModalAdd > div > div > div.modal-body > div > input:nth-child(5)  new project for test you see what i told you
    Click Button  css=#myModalAdd > div > div > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Delete New Project
    Click Button  xpath=/html/body/div[3]/div[2]/div[2]/table/tbody/tr[2]/td[4]/button
    Wait Until Element Is Visible  css=#confirmDelete
    Click Button  css=#myModalAdd > div > div > div > div > div.modal-footer > button.btn.btn-primary.btn-default
    Sleep  0.3

Update Project
    [Arguments]  ${name}
    Click Element  css=body > div.col-12.col-md-10.col-xl-8.py-md-3.pl-md-5.bd-content.ng-scope > div.col-sm-10.center-block.border-container.ng-scope > div.table-responsive.center-block.col-xs-12 > table > tbody > tr > td:nth-child(7) > button
    wait until element is visible  css=#myModalUpdate
    Input Text  //*[@id="myModalUpdate"]/div/div/div/div/input[3]  ${name}
    Click Button  css=#myModalUpdate > div > div > div > div > div.modal-footer > button.btn.btn-primary.btn-default    Sleep  0.3