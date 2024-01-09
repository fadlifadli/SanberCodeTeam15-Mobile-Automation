*** Settings ***
library         AppiumLibrary

*** Variables ***

# Base Robot
${REMOTE_URL}                                 http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}                              Android
${PLATFORM_VERSION}                           12.0
${DEVICE_NAME}                                emulator-5554
${APP_PACKAGE}                                com.example.myapplication
${APP_ACTIVITY}                               com.example.myapplication.MainActivity


${UserName}            support@ngendigital.com
${Password}            abc123
${bttn_Login}          //android.widget.Button[@resource-id="com.example.myapplication:id/login"]
# static booking ID for search: DA935
${field_Username}      //android.widget.EditText[@resource-id="com.example.myapplication:id/username"]
${field_Password}      //android.widget.EditText[@resource-id="com.example.myapplication:id/password"]
${bttn_sign in}        //android.widget.Button[@resource-id="com.example.myapplication:id/signIn"]


*** Keywords ***
Open Flight Application
    Open Application            remote_url=${REMOTE_URL}
    ...                         platformName=${PLATFORM_NAME}
    ...                         platformVersion=${PLATFORM_VERSION}
    ...                         deviceName=${DEVICE_NAME}
    ...                         appPackage=${APP_PACKAGE}
    ...                         appActivity=${APP_ACTIVITY}
Verify Login page
    Click Text                       ${bttn_sign in}
    Wait Until Element Is Visible    ${field_Username}
    Wait Until Element Is Visible    ${field_Password}
    Wait Until Element Is Visible    ${bttn_sign in}

Input User Email On Login Page
    [Arguments]   ${email}
    Input Text    ${field_Username}    ${email}

Input User Password On Login Page
    [Arguments]   ${pasword}
    Input Text    ${field_Password}    ${pasword}

Click Sign In Button On Login Page
    Click Element    ${bttn_sign in}

Login With Valid Credentials
    [Arguments]    ${email}=${UserName}    ${pasword}=${password}
    # Verify Home Page Appears
    # Click Sign In Button On Home Page
    # Verify Login Appears
    Input User Email On Login Page     ${email}
    Input User Password On Login Page  ${password}
    Click Sign In Button On Login Page


*** Test Cases ***
Login
    Open Flight Application
    # Verify Login page
    # Input User Email On Login Page
    # Input User Password On Login Page
    # Click Sign In Button On Login Page
    # Login With Valid Credentials