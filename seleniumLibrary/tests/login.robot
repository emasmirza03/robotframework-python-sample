*** Settings ***
Resource            ../resources/keywords.robot

Test Setup          Open Browser To Login Page
Test Teardown       Close Browser


*** Test Cases ***
Login Successfully
    Login With Valid Credential
    ${text}=    Get Text    ${LOGOUT_BUTTON}
    Should Be Equal As Strings    ${text}    Logout

Login With Invalid Credential
    Login With Invalid Password
    Wait Until Page Contains    Your email or password is incorrect!    timeout=10
