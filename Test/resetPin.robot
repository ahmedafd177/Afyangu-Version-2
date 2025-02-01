*** Settings ***
Library           SeleniumLibrary
Library           Dialogs
Resource          ../Resources/resources.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
# Application URL and Browser
${URL_SIGN_IN}          https://afyangu.kenya-hie.health/sign-in
${BROWSER}              chrome

# Reset PIN Page Elements
${RESET_PIN_LINK}       xpath://a[normalize-space(.)='Reset PIN']
${INPUT_ID_RESET}       xpath:/html/body/div/div[2]/div/form/div[3]/div[2]/input
${PROCEED_RESET}        xpath:/html/body/div/div[2]/div/form/button
${SEND_CODE_SELECT}     xpath:/html/body/div/main/div/div/div[2]/button
${SEND_CODE_BUTTON}      xpath=/html/body/div/main/div/div/button
${OTP_INPUT}            xpath:/html/body/div/main/div/div[2]/div/form/div[1]/div/div/div[2]/input
${OTP_PROCEED_BUTTON}   xpath:/html/body/div/main/div/div[2]/div/form/div[2]/button[2]
${NEW_PIN_INPUT}        xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/div[1]/div/div[1]/div[2]/input
${HIDE_PIN_1}            xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/div[1]/div/div[2]/img
${CONFIRM_PIN_INPUT}    xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/div[2]/div/div[1]/div[2]/input
${HIDE_PIN_2}            xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/div[2]/div/div[2]/img
${PROCEED_RST_2}        xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/button[2]

# Test Data
${VALID_ID}             36401812
${NEW_PIN}              1234

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL_SIGN_IN}    ${BROWSER}
    Maximize Browser Window

Navigate To Reset PIN Page
    [Documentation]    Navigates to the reset PIN page.
    ${current_url}=    Get Location
    Log    Current URL is: ${current_url}
    Wait Until Page Contains Element    ${RESET_PIN_LINK}    timeout=10s
    Scroll Element Into View    ${RESET_PIN_LINK}
    Sleep    3s
    Click Element    ${RESET_PIN_LINK}
    Sleep    5s

Input ID Number And Request OTP
    [Arguments]    ${id_number}
    Wait Until Page Contains Element    ${INPUT_ID_RESET}    timeout=10s
    Input Text    ${INPUT_ID_RESET}    ${id_number}
    sleep     5s
    Click Element    ${PROCEED_RESET}
    sleep     5s
    Click Element    ${SEND_CODE_SELECT} 
    Sleep        2s
    Click Element    ${SEND_CODE_BUTTON}
    Sleep    3s
Enter OTP And Proceed
    [Arguments]    ${otp_code}
    Wait Until Page Contains Element    ${OTP_INPUT}    timeout=10s
    Input Text    ${OTP_INPUT}    ${otp_code}
    Click Element    ${OTP_PROCEED_BUTTON}

Set New PIN
    [Arguments]    ${new_pin}
    Wait Until Page Contains Element    ${NEW_PIN_INPUT}    timeout=10s
    Input Text        ${NEW_PIN_INPUT}    ${new_pin}
    Click Element     ${HIDE_PIN_1}  
    Input Text        ${CONFIRM_PIN_INPUT}    ${new_pin}
    Click Element     ${HIDE_PIN_2}
    Click Element     ${PROCEED_RST_2}
    Sleep            10s

*** Test Cases ***
Reset PIN With Valid ID
    [Documentation]    Test the basic PIN reset flow with a valid ID number.
    [Tags]    reset-pin    positive
    Navigate To Reset PIN Page
    Input ID Number And Request OTP    ${VALID_ID}
    ${otp_code}=    Get Value From User    Please enter the OTP received:
    Enter OTP And Proceed    ${otp_code}
    Set New PIN    ${NEW_PIN}
