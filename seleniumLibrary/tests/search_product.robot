*** Settings ***
Resource            ../resources/keywords.robot

Test Setup          Open Browser To Login Page
Test Teardown       Close Browser


*** Test Cases ***
Search Existing Product
    Login With Valid Credential
    Search For Product and Verify    tshirt
