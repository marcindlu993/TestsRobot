*** Settings ***
Documentation  Main test program checking login page

Library  Selenium2Library
Resource  resources.robot

*** Keywords ***
Test Valid Login
    Open Browser And Valid Test
    Logout From Site

Open Browser And Valid Test
#    Open Browser To Login Page
    Login Page Should Be Open
    Login Site  Marcin  Qwerty12!
    Sleep  0.1
    Timesheet Location Should Be Open

Logout From Site
    Logout
    Signin Location Should Be Open