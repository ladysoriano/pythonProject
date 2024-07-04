*** Settings ***
Resource    ../PageObject/page-keywords/submit-new-application.robot
Resource    ../PageObject/page-keywords/common.robot

*** Test Cases ***
Verify Submission of Application is Successful
    [Setup]     Generate Test Data
    Given Form for new application is filled out
    And All Values Entered in the Summary Screen is correct
    When User clicked on Validate and Send button
    Then User is redirected to "Thank you for submitting your project" page
