*** Settings ***
Library           SeleniumLibrary
Library           Dialogs
Resource          ../Resources/resources.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Login Page Task
    [Tags]    login    otp
    [Documentation]    Executes the login page steps including OTP verification.
    Perform Login    36401812    2222
    Verify OTP Manually
    Sleep    20s    # Simulate waiting on the home page (if needed)

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${LOGIN_BUTTON}    timeout=10s

Perform Login
    [Arguments]    ${id}    ${pin}
    [Documentation]    Logs in using the provided ID and PIN.
    sleep     5s
    Click Element    ${LOGIN_BUTTON}
    sleep     2s
#    Wait Until Element Is Visible    ${ID_INPUT}    timeout=10s
    Input Text       ${ID_INPUT}    ${id}
    Wait Until Element Is Visible    ${PIN_INPUT_LOGIN}       timeout=10s
    Input Text       ${PIN_INPUT_LOGIN}      ${pin}
    Sleep        2s
    Click Element    ${HIDE_PASSWORD_LOGIN}
    Sleep    3s
    Wait Until Element Is Visible    ${SEND_CODE_BUTTON_LOGIN}    timeout=10s
    Sleep    3s
    Click Element    ${SEND_CODE_BUTTON_LOGIN}

Verify OTP Manually
    [Documentation]    Prompts the user to manually enter the OTP and proceeds.
#    Wait Until Element Is Visible    ${OTP_INPUT}    timeout=10s
    ${otp}=    Get Value From User    Please enter the OTP:
    Input Text    ${OTP_INPUT_LOGIN}    ${otp}
#    Wait Until Element Is Visible    ${OTP_PROCEED_BUTTON}    timeout=10s

    sleep     5s
    Click Element    ${OTP_PROCEED_BUTTON}

