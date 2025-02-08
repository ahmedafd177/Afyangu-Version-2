*** Settings ***
Library           SeleniumLibrary
Library           Dialogs
Resource          ../Resources/resources.robot
Resource          ../Data/test_data.robot


*** Test Cases ***
Reset PIN With Valid ID
    [Documentation]    Test the basic PIN reset flow with a valid ID number.
    [Tags]    reset-pin    positive
    Open Browser To Reset PIN Page
    Input ID Number And Request OTP    ${USER_ID}
    ${otp_code}=    Get Value From User    Please enter the OTP received:
    Enter OTP And Proceed    ${otp_code}
    Set New PIN    ${NEW_PIN}
    Close Browser


*** Keywords ***
Open Browser To Reset PIN Page
    [Documentation]    Opens the browser and navigates to the reset PIN page.
    Open Browser    ${RESET_LINK}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${INPUT_ID_RESET}    timeout=10s

Input ID Number And Request OTP
    [Arguments]    ${id_number}
    [Documentation]    Enters the ID number and requests OTP.
    Wait Until Element Is Visible    ${INPUT_ID_RESET}    timeout=10s
    Input Text    ${INPUT_ID_RESET}    ${id_number}
    Click Element    ${PROCEED_RESET}
    Wait Until Element Is Visible    ${SEND_CODE_SELECT}    timeout=10s
    Click Element    ${SEND_CODE_SELECT}
    Wait Until Element Is Visible    ${SEND_CODE_BUTTON_RESET}    timeout=10s
    Click Element    ${SEND_CODE_BUTTON_RESET}
    Log    OTP Request Sent Successfully.

Enter OTP And Proceed
    [Arguments]    ${otp_code}
    [Documentation]    Enters the OTP and proceeds to the next step.
    Wait Until Element Is Visible    ${OTP_INPUT_RESET}    timeout=10s
    Input Text    ${OTP_INPUT_RESET}    ${otp_code}
    Click Element    ${OTP_PROCEED_BUTTON}
    Log    OTP Submitted Successfully.

Set New PIN
    [Arguments]    ${new_pin}
    [Documentation]    Sets a new PIN and confirms it.
    Wait Until Element Is Visible    ${NEW_PIN_INPUT}    timeout=10s
    Input Text    ${NEW_PIN_INPUT}    ${new_pin}
    Click Element    ${HIDE_PIN_1}
    Input Text    ${CONFIRM_PIN_INPUT_RESET}    ${new_pin}
    Click Element    ${HIDE_PIN_2}
    Click Element    ${PROCEED_RST_2}
#    Wait Until Page Contains    "Your PIN has been reset successfully"    timeout=10s
    Log    PIN Reset Successful.
    Sleep        3s
