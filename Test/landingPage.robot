*** Settings ***
Documentation     Test navigation functionality of Afyangu website
...               Includes tests for How to Register, FAQs Page, Contact, and Resources sections
Library           SeleniumLibrary
Resource          ../Resources/resources.robot


*** Test Cases ***
Test How To Register Navigation
    [Documentation]    Test navigation and scrolling for How To Register section
    [Tags]    navigation    how to register
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    ${HOW_TO_REGISTER}
    Sleep    3s
    Click Element    ${MINISTRY_LOGO}
    Sleep    1s

Test FAQs Navigation
    [Documentation]    Test navigation and scrolling for FAQs page
    [Tags]            navigation    faqs

    Click Element    ${FAQS}
    Sleep    3s
#    adding Search text field
#    Click Element    ${GET_IN_TOUCH_BTN}
    Click Element    ${MINISTRY_LOGO}
    Sleep   1s

Test Contact Navigation
    [Documentation]    Test navigation and scrolling for Contact page

    Click Element    ${CONTACT}
    sleep     3s
    Click Element    ${MINISTRY_LOGO}

Test Resources Navigation
    [Documentation]    Test navigation and scrolling for Resources page
    [Tags]            navigation    resources

    Click Element                    ${RESOURCES}
    Sleep    3s
    Click Element                    ${PRIVACY_POLICY}
    sleep     3s
    Scroll Element Into View        ${CANCEL_BTN_PRIVACY}
    Sleep    5s
    Click Element                   ${CANCEL_BTN_PRIVACY}

    Sleep    2s
    [Teardown]       Close Browser

