*** Settings ***
Library           SeleniumLibrary
Library           Dialogs
Resource         ../Resources/resources.robot
Library           SeleniumLibrary

*** Test Cases ***
Registration Workflow
    [Tags]    registration    otp
    [Documentation]   Test registration workflow including OTP verification and PIN setup.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    3s

    # Start registration process
    Wait Until Element Is Visible    ${REGISTER_BUTTON}    timeout=10s
    Click Element                    ${REGISTER_BUTTON}

    Wait Until Element Is Visible    ${PROCEED_BUTTON}    timeout=10s
    Click Element                    ${PROCEED_BUTTON}

    # Fill out registration details
    Wait Until Element Is Visible    ${ID_NO}    timeout=10s
    Input Text                       ${ID_NO}        357952441
    Sleep    3s
    Input Text                       ${FIRST_NAME}   Umi
    Sleep    3s
    Input Text                       ${PHONE_NO}     756370837
    Sleep    3s

    Click Element                    ${PROCEED_BUTTON_2}

    # OTP selection and sending code
    Wait Until Element Is Visible    ${SELECT_OPTION}    timeout=10s
    Sleep    5s
    Click Element                    ${SELECT_OPTION}
    sleep     3s
    Wait Until Element Is Visible    ${SEND_CODE_BUTTON}    timeout=10s
    Click Element                    ${SEND_CODE_BUTTON}

    # OTP Entry: prompt user to enter OTP
    Wait Until Element Is Visible    ${OTP_INPUT}    timeout=10s
    ${otp}=    Get Value From User    Please enter the OTP number:
    Input Text                       ${OTP_INPUT}    ${otp}
    Click Element                    ${PROCEED_BUTTON_3}
    Sleep    3s

    # PIN Setup
    Wait Until Element Is Visible    ${PIN_INPUT}    timeout=10s
    Input Text                       ${PIN_INPUT}           3435
    Click Element    xpath:/html/body/div/main/div/div[2]/div[2]/div/div/div/form/div[1]/div/div[2]/img
    Sleep    2s
    Input Text                       ${CONFIRM_PIN_INPUT}   3435
    Click Element    xpath:/html/body/div/main/div/div[2]/div[2]/div/div/div/form/div[2]/div/div[2]/img
    Sleep    4s
    Click Element                    ${FINAL_SUBMIT}
    Sleep    3s

    # Optionally, add validations to confirm successful registration

    Close Browser
