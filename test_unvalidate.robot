*** Settings ***
Documentation  Test login on unvalidate data

Library  Selenium2Library
Resource  resources.robot

*** Keywords ***
Test Unvalid Logins
    Open Browser To Invalid Test
    Input Invalid Both
    Input Invalid Password
    Input Invalid Username

Open Browser To Invalid Test
    Open Browser To Login Page
    Login Page Should Be Open

Input Invalid Both
    Login Site  unvalid  unvalid
    Signin Location Should Be Open

Input Invalid Password
    Login Site  Marcin  unvalid
    Signin Location Should Be Open

Input Invalid Username
    Login Site  unvalid  Qwerty12!
    Signin Location Should Be Open
