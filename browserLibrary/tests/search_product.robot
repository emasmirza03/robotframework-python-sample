*** Settings ***
Resource    ../resources/keywords.robot


*** Test Cases ***
Search Existing Product
    Open Browser To Login Page
    Login With Valid Credential
    Search For Product and Verify    tshirt
    Close Browser
