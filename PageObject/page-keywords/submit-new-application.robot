*** Settings ***
Library     SeleniumLibrary     timeout=60
Library     JSONLibrary
Library     OperatingSystem
Resource    login.robot
Variables    ../locators/Locators.py

*** Keywords ***
Form for new application is filled out
    Login to Exam Website    QATESTER1
    Submit a new application
    Fill out the form

Submit a new application
    Wait Until Element Is Visible    ${loc_submit_new_application_btn}
    Click Element    ${loc_submit_new_application_btn}
    ${continue_submission_present}      Run Keyword And Return Status    Element Should Be Visible    ${loc_continue_submission_page}
    Run Keyword If    "${continue_submission_present}" == "True"    Click Element    ${loc_submit_new_application_link}
    Wait Until Element Is Visible    ${loc_fill_out_forms_page}

Fill out the form
    Wait Until Element Is Visible    ${loc_first_name_txt}
    Input Text    ${loc_first_name_txt}    ${first_name}
    Input Text    ${loc_last_name_txt}    ${last_name}
    Input Text    ${loc_address_txt}    ${address}
    Scroll Element Into View    ${loc_upload_btn}
    Wait Until Element Is Visible    ${loc_postal_code_txt}
    Input Text    ${loc_postal_code_txt}    1000
    Wait Until Element Is Visible    ${loc_postal_code_popup}
    Click Element    ${loc_postal_code_popup}
    Select From List By Value    ${loc_country_select}  AF
    Choose File    ${loc_upload_btn}    ${EXECDIR}/PageObject/test-data/test.png
    Scroll Element Into View    ${loc_role_select}
    Click Element    ${loc_gender_rdbtn}
    Select From List By Value    ${loc_role_select}     be78a319-8d16-5788-9412-0e1e0cd80bee
    Scroll Element Into View    ${loc_tools_chkbx}
    Click Element    ${loc_tools_chkbx}
    Scroll Element Into View    ${loc_next_screen_btn}
    Select Frame    ${loc_objective_frame}
    Input Text    ${loc_objective_txt}    ${objective}
    Unselect Frame
    Click Element    ${loc_next_screen_btn}

All Values Entered in the Summary Screen is correct
    Wait Until Element Is Visible    ${loc_validate_send_btn}
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_first_name_label}    ${first_name}
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_last_name_label}    ${last_name}
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_address_label}    ${address}
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_postal_code_label}    1000 - Bruxelles / Brussel
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_country_label}    Afghanistan
    Scroll Element Into View    ${loc_validate_send_btn}
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_image_label}    test.png
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_gender_label}    Male
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_role_label}    Manual tester
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_tools_label}    Cypress
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_objective_label}    ${objective}

User clicked on Validate and Send button
    Click Element    ${loc_validate_send_btn}

User is redirected to "Thank you for submitting your project" page
    Wait Until Element Is Visible    ${loc_thank_you_page}
    Run Keyword And Continue On Failure    Element Text Should Be    ${loc_thank_you_page}    Thank you for submitting your project