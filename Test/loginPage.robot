*** Settings ***
Library           SeleniumLibrary
Library           Dialogs
Resource          ../Resources/resources.robot
Resource          ../Data/test_data.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Valid Login Test
    [Tags]    login    otp    valid_credentials
    [Documentation]    Executes the login workflow with a valid user ID and valid PIN.
    Perform Login        ${USER_ID}    ${USER_PIN}
    Verify OTP Manually
    Sleep    2s
    Close Browser

Invalid ID Test
    [Tags]    login    otp    invalid_id
    [Documentation]    Executes the login workflow using an invalid user ID and a valid PIN.
    Open Browser To Login Page
    Perform Invalid Login             ${INVALID_USER_ID}    ${USER_PIN}
    Sleep    2s
    Log    Invalid ID.
    Close Browser
    

Invalid PIN Test
    [Tags]    login    otp    invalid_pin
    [Documentation]    Executes the login workflow using a valid user ID and an invalid PIN.
    Open Browser To Login Page
    Perform Invalid Login     ${USER_ID}    ${INVALID_USER_PIN}
    #Error pops up
    Log    Invalid ID.
    Sleep        2s
    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${LOGIN_BUTTON}    timeout=10s

Perform Login
    [Arguments]    ${id}    ${pin}
    [Documentation]    Logs in using the provided ID and PIN. Steps ensure input fields are correctly populated and actions performed.
    Sleep     2s
    Click Element    ${LOGIN_BUTTON}
    Sleep     2s
    Input Text       ${ID_INPUT}    ${id}
    Sleep    2s
    Wait Until Element Is Visible    ${PIN_INPUT_LOGIN}    timeout=10s
    Input Text       ${PIN_INPUT_LOGIN}    ${pin}
    Sleep    0.5s
    Click Element    ${HIDE_PASSWORD_LOGIN}
    Sleep    0.5s
    Click Element    ${SEND_CODE_BUTTON_LOGIN}

Perform Invalid Login
    [Arguments]    ${id}    ${pin}
    [Documentation]    Logs in using the provided ID and PIN, then stops further login processing when the error message is displayed.
    Perform Login    ${id}    ${pin}
    Close Browser

Verify OTP Manually
    [Documentation]    Prompts the user to manually enter the OTP and proceeds with the login process.
    ${otp}=    Get Value From User    Please enter the OTP:
    Input Text    ${OTP_INPUT_LOGIN}    ${otp}
    Sleep    2s
    Click Element    ${OTP_PROCEED_BUTTON}

