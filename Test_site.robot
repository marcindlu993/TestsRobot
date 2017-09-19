*** Settings ***
Documentation  Main test program of this page

Resource  resources.robot
Resource  test_validate.robot
Resource  test_unvalidate.robot

*** Test Cases ***
Open Browser To Login Page Test
    Open Browser To Login Page

Test Valid Login On Page
    Test Valid Login

Test Unvalid Logins On Page
    Test Unvalid Logins