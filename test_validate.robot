*** Settings ***
Documentation  Main test program checking login page

Library  Selenium2Library
Resource  resources.robot
Suite Teardown  Close browser

*** Test Cases ***
Test Valid Login
    Open Browser and valid test
    Logout from site

*** Keywords ***
Open Browser And Valid Test
    Open browser to login page
    Login page should be open
    Login to site
    Timesheet location should be open

Logout From Site
    Logout
    Signin location should be open