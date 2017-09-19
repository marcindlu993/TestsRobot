*** Settings ***
Documentation  Main test program of this page

Resource  test_validate.robot
Resource  test_unvalidate.robot

*** Test Cases ***
Test Valid Login On Page
    Test Valid Login

Test Unvalid Logins On Page
    Test Unvalid Logins