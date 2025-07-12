*** Settings ***
Library     Browser
Library     Collections
Resource    ../resources/variables.robot
Resource    ../resources/locators.robot


*** Keywords ***
Open Browser To Login Page
    New Browser    headless=false
    New Page    ${BASE_URL}    domcontentloaded
    Click    ${LOGIN_BUTTON}

Login With Valid Credential
    Fill Text    ${EMAIL_INPUT}    ${VALID_EMAIL}
    Fill Text    ${PASSWORD_INPUT}    ${VALID_PASSWORD}
    Click    ${SUBMIT_LOGIN}

Search For Product And Verify
    [Arguments]    ${search_text}
    Click    ${MENU_PRODUCTS}
    Fill Text    ${SEARCH_INPUT}    ${search_text}
    Click    ${SEARCH_BUTTON}
    Get All Product Texts
    Should Contain Word    ${joined_text}    ${search_text}

Get All Product Texts
    ${elements}=    Get Elements    ${PRODUCT_INFO}
    ${text_list}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${text_list}    ${text}
    END
    Log To Console    \n${text_list}
    ${joined_text}=    Join Text List    ${text_list}
    Set Suite Variable    ${joined_text}

Should Contain Word
    [Arguments]    ${text}    ${word}
    ${found}=    Evaluate    "${word.lower()}" in "${text.lower()}"
    Should Be True    ${found}    msg=Text does not contain the word "${word}"

Join Text List
    [Arguments]    @{text_items}
    ${result}=    Evaluate    ' '.join([str(t) for t in ${text_items}])
    RETURN    ${result}

Login With Invalid Password
    Fill Text    ${EMAIL_INPUT}    ${VALID_EMAIL}
    Fill Text    ${PASSWORD_INPUT}    XXXXXXXX
    Click    ${SUBMIT_LOGIN}

Submit Login Form With Empty Fields
    Fill Text    ${EMAIL_INPUT}    ${EMPTY}
    Fill Text    ${PASSWORD_INPUT}    ${EMPTY}
    Click    ${SUBMIT_LOGIN}
