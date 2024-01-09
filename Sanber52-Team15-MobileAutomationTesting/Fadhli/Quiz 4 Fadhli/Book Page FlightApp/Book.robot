*** Settings ***
Resource         ../pageObjects/homePageObject/homePage.robot
Resource         ../pageObjects/loginPageObject/loginPage.robot
Test Setup       Run Keywords    
...              Open Flight Application 
...              AND Login With Valid Credentials
Test Teardown    Close Flight Application
Library                 AppiumLibrary

# Resource                ../base/base.robot
# Resource                ../homePageObject/homePage.robot
# Variables               loginpage_locators.yaml
# Variables               xpathBook.yaml
# Library                 AppiumLibrary

*** Variables ***
${VALID_EMAIL}               support@ngendigital.com
${VALID_PASSWORD}            abc123

*** Keywords ***
Verify Login Appears
    Wait Until Element Is Visible    ${email_input_loginPage}
    Wait Until Element Is Visible    ${password_input_loginPage}
    Wait Until Element Is Visible    ${signIn_button_loginPage}

Input User Email On Login Page
    [Arguments]   ${email}
    Input Text    ${email_input_loginPage}    ${email}

Input User Password On Login Page
    [Arguments]   ${password}
    Input Text    ${password_input_loginPage}    ${password}

Click Sign In Button On Login Page
    Click Element    ${signIn_button_loginPage}

Login With Valid Credentials
    [Arguments]    ${email}=${VALID_EMAIL}    ${password}=${VALID_PASSWORD}
    Verify Home Page Appears
    Click Sign In Button On Home Page
    Verify Login Appears
    Input User Email On Login Page     ${email}
    Input User Password On Login Page  ${password}
    Click Sign In Button On Login Page

Booking Flight
    Click Element     ${BookFlightPage}
    Click Element     ${FromCityOneWay}
    Click Element     ${StartDate}
    Click Element     ${Date1PickStart}
    Click Element     ${EndDate}
    Click Element     ${Date1PickStart}
    Click Element     ${FlightChoose}
    Click Element     ${ButtonBookFromCity} 
    Click Element     ${ButtonConfirm} 
    Click Element     ${ClickPricePertama} 
    Click Element     ${TextSuccesCreated}

*** Test Cases ***
Open appActivity
    Verify Home Page Appears
    # login
    Click Sign In Button On Home Page
    Verify Login Appears
    Input User Email On Login Page               ${VALID_EMAIL}
    Input User Password On Login Page            ${VALID_PASSWORD}
    Click Sign In Button On Login Page
    Verify User Is Logged In
    # booking
    Booking Flight
