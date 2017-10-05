*** Settings ***
Documentation  Test login on unvalidate data

Library  Selenium2Library
Resource  resources.robot
Suite Teardown  Close browser

*** Test Cases ***
Test Unvalid Logins
    Open browser to login page
    Input invalid both
    Input invalid password
    Input invalid username

*** Keywords ***
Input Invalid Both
    Login site  unvalid  unvalid
    Signin location should be open

Input Invalid Password
    Login site  Marcin  unvalid
    Signin location should be open

Input Invalid Username
    Login site  unvalid  Qwerty12!
    Signin location should be open
