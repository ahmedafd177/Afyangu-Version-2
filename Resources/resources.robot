*** Variables ***
# Browser and URL Configuration
${BROWSER}               chrome
${URL}                  https://afyangu.kenya-hie.health/
${REGISTER_LINK}        ${URL}/register
${URL_SIGN_IN}          ${URL}/sign-in
${RESET_LINK}           ${URL}/pin-reset
${TIMEOUT}              10s


# Navigation Elements
${MINISTRY_LOGO}        xpath=//img[@alt="logo"][@class="MinistryOfHealthLogo_moh_logo__v7ff3"]
${HOW_TO_REGISTER}      xpath=/html/body/div/header/div[2]/div[1]/button[1]
#FQA page
${FAQS}                 xpath=/html/body/div/header/div[2]/div[1]/button[2]
${FQA_SEARCH}           xpath=/html/body/div/main/div/div[1]/input
${EXPAND_AFYANGU}       xpath=/html/body/div/main/div/div[2]/div[1]/div[1]/div/h3/button
${EXPAND_AFYANGU_2}     xpath=/html/body/div/main/div/div[2]/div[1]/div[2]/div/h3/button
${CONTACT}              xpath=/html/body/div/header/div[2]/div[1]/button[3]
${RESOURCES}            xpath=/html/body/div/header/div[2]/div[1]/button[4]

# Resources Section Elements
${TERMS_CONDITION}      xpath=/html/body/div[4]/div[1]/button[1]
${RESOURCES_BACK_BTN}   xpath=/html/body/div[4]/div[2]/button/img
${PRIVACY_POLICY}       xpath=/html/body/div[4]/div[1]/button[2]
${CANCEL_BTN_PRIVACY}   xpath=/html/body/div[4]/div[3]/div/div/div[3]/button[1]

# Footer and Additional Elements
${FOOTER}              xpath=/html/body/div/footer
${GET_IN_TOUCH_BTN}    xpath=/html/body/div/main/div/div[2]/div[2]/button

# Registration Page Elements
${REGISTRATION_BUTTON}  xpath=/html/body/div/header/div[2]/div[2]/a[2]
${INITIAL_PROCEED}      xpath=//button[contains(text(), 'Proceed')]
${ID_NUMBER_INPUT}      xpath=/html/body/div/div[3]/div[2]/form/div[2]/div/input
${FIRST_NAME_INPUT}     xpath=/html/body/div/div[3]/div[2]/form/div[3]/div/input
${PHONE_NUMBER_INPUT}   xpath=/html/body/div/div[3]/div[2]/form/div[4]/div/div/div/input
${FINAL_PROCEED}        xpath=/html/body/div/div[3]/div[2]/form/div[6]/div/button[2]
${CHECKBOX}             xpath=/html/body/div/main/div/div[2]/div/div/div[2]/button
${SEND_CODE_BUTTON}     xpath=/html/body/div/main/div/div[2]/div/div/button
${OTP_INPUT}           xpath=/html/body/div/main/div/div[2]/div/div[2]/div/form/div[1]/div/div/div[2]/input
${OTP_PROCEED}         xpath=/html/body/div/main/div/div[2]/div/div[2]/div/form/div[2]/button[2]
${PIN_INPUT}           xpath=/html/body/div/main/div/div[2]/div[2]/div/div/div/form/div[1]/div/div[1]/div[2]/input
${HIDE_PASSWORD_RG}     xpath=/html/body/div/main/div/div[2]/div[2]/div/div/div/form/div[1]/div/div[2]/img
${CONFIRM_PIN_INPUT}   xpath=/html/body/div/main/div/div[2]/div[2]/div/div/div/form/div[2]/div/div[1]/div[2]/input
${HIDE_PASSWORD_RG_2}   xpath=/html/body/div/main/div/div[2]/div[2]/div/div/div/form/div[2]/div/div[2]/img
${PIN_PROCEED}         xpath=/html/body/div/main/div/div[2]/div[2]/div/div/div/form/button[2]
${SUCCESS_PROCEED}     xpath=/html/body/div/main/div/div[2]/button
${CONTINUE_REG}        xpath=/html/body/div[4]/div/div[1]/div[2]/button[2]


# Login Page Locators
${LOGIN_BUTTON}                xpath:/html/body/div/header/div[2]/div[2]/button[1]
${ID_INPUT}                    xpath:/html/body/div/div[2]/div/form/div[3]/div[2]/input
${PIN_INPUT_LOGIN}             xpath:/html/body/div/div[2]/div/form/div[5]/div[1]/div[2]/input
${HIDE_PASSWORD_LOGIN}         xpath:/html/body/div/div[2]/div/form/div[5]/div[2]/img
${SEND_CODE_BUTTON_LOGIN}      xpath:/html/body/div/div[2]/div/form/button
${OTP_INPUT_LOGIN}             xpath:/html/body/div/main/div/div[2]/div/form/div[1]/div/div/div[2]/input
${OTP_PROCEED_BUTTON}          xpath:/html/body/div/main/div/div[2]/div/form/div[2]/button[2]
${ERROR_MESSAGE}               xpath:/html/body/div/div[1]/div/div/div[1]/div[2]


# Reset PIN Page Elements
${RESET_PIN_LINK_TEXT}                    xpath:/html/body/div/div[3]/div/form/div[6]/a
${INPUT_ID_RESET}                   xpath:/html/body/div/div[2]/div/form/div[3]/div[2]/input
${PROCEED_RESET}                    xpath:/html/body/div/div[2]/div/form/button
${SEND_CODE_SELECT}                 xpath:/html/body/div/main/div/div/div[2]/button
${SEND_CODE_BUTTON_RESET}           xpath=/html/body/div/main/div/div/button
${OTP_INPUT_RESET}                        xpath:/html/body/div/main/div/div[2]/div/form/div[1]/div/div/div[2]/input
${OTP_PROCEED_BUTTON}               xpath:/html/body/div/main/div/div[2]/div/form/div[2]/button[2]
${NEW_PIN_INPUT}                    xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/div[1]/div/div[1]/div[2]/input
${HIDE_PIN_1}                        xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/div[1]/div/div[2]/img
${CONFIRM_PIN_INPUT_RESET}                xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/div[2]/div/div[1]/div[2]/input
${HIDE_PIN_2}                        xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/div[2]/div/div[2]/img
${PROCEED_RST_2}                    xpath:/html/body/div/main/div/div/div[2]/div/div/div/form/button[2]
