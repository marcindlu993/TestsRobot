*** Settings ***
Documentation  Main test program of this page

Resource  resources.robot
Resource  test_validate.robot
Resource  test_unvalidate.robot
Resource  test_resource_employees.robot

*** Test Cases ***
Open Browser To Login Page Test
    Open Browser To Login Page

Test Unvalid Logins On Page
    Test Unvalid Logins

Test Valid Login On Page
    Test Valid Login

Test Resource Employees
    Test Resource Employees