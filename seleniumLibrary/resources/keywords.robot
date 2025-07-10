*** Settings ***
Library     SeleniumLibrary    run_on_failure=nothing    implicit_wait=3    timeout=8
Library     Collections
Resource    ../resources/variables.robot
Resource    ../resources/locators.robot


*** Keywords ***
Open Browser To Login Page
    Open Browser
    ...    ${BASE_URL}
    ...    chrome
    ...    options=add_argument("--disable-popup-blocking");add_argument("--window-size=1500,800");add_argument("--ignore-certificate-errors");add_argument("--start-maximized")
    Set Selenium Speed    0.1
    #Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Click Element    ${LOGIN_BUTTON}

Login With Valid Credential
    Input Text    ${EMAIL_INPUT}    ${VALID_EMAIL}
    Input Text    ${PASSWORD_INPUT}    ${VALID_PASSWORD}
    Click Button    ${SUBMIT_LOGIN}

Search For Product And Verify
    [Arguments]    ${search_text}
    Click Element    ${MENU_PRODUCTS}
    Wait Until Element Is Visible    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${search_text}
    Click Button    ${SEARCH_BUTTON}
    ${text_list}=    Get All Product Texts
    ${joined_text}=    Join Text List    ${text_list}
    Should Contain Word    ${joined_text}    ${search_text}

Get All Product Texts
    ${elements}=    Get WebElements    ${PRODUCT_INFO}
    ${text_list}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${text_list}    ${text}
    END
    Log To Console    \n${text_list}
    RETURN    ${text_list}

Should Contain Word
    [Arguments]    ${text}    ${word}
    ${found}=    Evaluate    "${word.lower()}" in "${text.lower()}"
    Should Be True    ${found}    msg=Text does not contain the word "${word}"

Join Text List
    [Arguments]    @{text_items}
    ${result}=    Evaluate    ' '.join([str(t) for t in ${text_items}])
    RETURN    ${result}

Login With Invalid Password
    Input Text    ${EMAIL_INPUT}    ${VALID_EMAIL}
    Input Text    ${PASSWORD_INPUT}    XXXXXXXX
    Click Button    ${SUBMIT_LOGIN}

Submit Login Form With Empty Fields
    Input Text    ${EMAIL_INPUT}    ${EMPTY}
    Input Text    ${PASSWORD_INPUT}    ${EMPTY}
    Click Button    ${SUBMIT_LOGIN}
