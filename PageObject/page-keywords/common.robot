*** Settings ***
Library     String
Resource    login.robot

*** Keywords ***
Generate Random Data
    [Arguments]     ${data_type}
    ${data_length}      Set Variable If    "${data_type}"=="name"   8   25
    ${data_characters}      Set Variable If    "${data_type}"=="name"   [LETTERS]   [LETTERS][NUMBERS]
    ${string_data}      Generate Random String      ${data_length}  ${data_characters}
    [Return]    ${string_data}

Generate Test Data
    ${first_name}   Generate Random Data    name
    Set Test Variable    ${first_name}
    ${last_name}    Generate Random Data    name
    Set Test Variable    ${last_name}
    ${address}      Generate Random Data    address
    Set Test Variable    ${address}
    ${objective}    Generate Random Data    objective
    Set Test Variable    ${objective}