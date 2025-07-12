*** Settings ***
Resource    ../resources/keywords.robot


*** Test Cases ***
Login Successfully
    Open Browser To Login Page
    Login With Valid Credential
    Get Text    ${LOGOUT_BUTTON}    ==    ${SPACE}Logout
    Close Browser

Login With Invalid Credential
    Open Browser To Login Page
    Login With Invalid Password
    Wait For Elements State    text=Your email or password is incorrect!    visible
    Close Browser
