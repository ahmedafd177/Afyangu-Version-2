*** Settings ***
Documentation     Test navigation functionality of Afyangu website
...               Includes tests for How to Register, FAQs Page, Contact, and Resources sections
Library           SeleniumLibrary
Resource          ../Resources/resources.robot


*** Test Cases ***
Test How To Register Navigation
    [Documentation]    Test navigation to How To Register section
    [Tags]        how to register section
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element            ${HOW_TO_REGISTER}
    Sleep    3s
    Click Element            ${MINISTRY_LOGO}
    Sleep    1s

Test FAQs Navigation
    [Documentation]    Test navigation for FAQs page
    [Tags]            FAQs Page

    Click Element    ${FAQS}
    Wait Until Element Is Visible    ${FQA_SEARCH}    timeout=10s
    Input Text    ${FQA_SEARCH}    What is Afyangu

    Click Element If Exists    ${EXPAND_AFYANGU}
    Click Element If Exists    ${EXPAND_AFYANGU_2}

    Click And Verify Navigation    ${GET_IN_TOUCH_BTN}    ${EXPECTED_PAGE_ELEMENT}

    Click Element If Exists    ${MINISTRY_LOGO}

Test Contact Navigation
    [Documentation]    Test navigation  for Contact Section
    [Tags]             contact section
    Click Element    ${CONTACT}
    sleep     3s
    Click Element    ${MINISTRY_LOGO}

Test Resources Navigation
    [Documentation]    Test navigation for Resource page
    [Tags]             resources Page

    Click Element                    ${RESOURCES}
    Sleep    3s
    Click Element                    ${TERMS_CONDITION}
    Sleep     2s
    Click Element                    ${PRIVACY_POLICY}
    sleep     2s
    Click Element                    ${RESOURCES_BACK_BTN}
#    Download DPF for Terms and Condition
    Click Element                    ${RESOURCES}
    Scroll Element Into View        ${CANCEL_BTN_PRIVACY}
    Sleep    2s
    Click Element                   ${CANCEL_BTN_PRIVACY}

    Sleep    1s
    [Teardown]       Close Browser


*** Keywords ***
Click Element If Exists
    [Arguments]    ${locator}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    timeout=5s
    Run Keyword If    ${status}    Click Element    ${locator}    ELSE    Log    ${locator} is Not Clickable

Click And Verify Navigation
    [Arguments]    ${button}    ${expected_element}
    ${status}=    Run Keyword And Return Status    Click Element    ${button}
    Run Keyword If    not ${status}    Fail    ${button} is Not Clickable - Test Failed!

    Wait Until Element Is Visible    ${expected_element}    timeout=10s