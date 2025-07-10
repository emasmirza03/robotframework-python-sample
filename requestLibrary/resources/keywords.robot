*** Settings ***
Library     RequestsLibrary
Resource    ../resources/variables.robot


*** Keywords ***
Create Reqres Session
    ${headers}=    Create Dictionary    x-api-key=reqres-free-v1    Content-Type=application/json
    Create Session    reqres    ${BASE_URL}    headers=${headers}    verify=${True}
