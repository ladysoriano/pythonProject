*** Settings ***
Library     SeleniumLibrary     timeout=60
Library     JSONLibrary
Library     OperatingSystem
Variables    ../locators/Locators.py

*** Variables ***
${EXAM_WEBSITE_URL}   https://qrqck8u5t9co.front.staging.optimy.net/en/

*** Keywords ***
Get Login Credentials From Json File
    [Arguments]    ${email_json_object}
    ${test_data}    Get File    ${CURDIR}/../test-data/Login_Credentials.json    encoding=iso-8859-1   encoding_errors=strict
    ${test_data}    Convert To String     ${test_data}
    ${test_data}    Convert String To Json    ${test_data}
    @{username}    Get Value From Json    ${test_data}    $.${email_json_object}.username
    @{password}    Get Value From Json    ${test_data}    $.${email_json_object}.password
    ${login_username}    Set Variable    ${username[0]}
    ${login_password}    Set Variable    ${password[0]}
    Set Suite Variable    ${login_username}
    Set Suite Variable    ${login_password}

Login to Exam Website
    [Arguments]    ${qa_creds}
    Get Login Credentials From Json File    ${qa_creds}
    Open Browser    ${EXAM_WEBSITE_URL}   gc
    Maximize Browser Window
    ${close_cookies_btn_present}    Run Keyword And Return Status    Element Should Be Visible    ${loc_close_cookies_btn}
    Run Keyword If    "${close_cookies_btn_present}" == "True"    Click Element    ${loc_close_cookies_btn}
    Wait Until Element Is Visible    ${loc_access_my_account_link}
    Click Element    ${loc_access_my_account_link}
    Wait Until Element Is Visible    ${loc_login_email_txt}
    Input Text    ${loc_login_email_txt}    ${login_username}
    Input Password    ${loc_login_password_txt}    ${login_password}
    Click Element    ${loc_login_btn}