*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    https://automationexercise.com/

*** Variables ***
${BROWSER}        chrome
${EMAIL}          65022601@up.ac.th
${PASSWORD}       tumtum12

*** Keywords ***

INPUT_EMAIL
    [Arguments]    ${EMAIL}
    Input Text     //*[@name='email']     ${EMAIL}

INPUT_PASSWORD
    [Arguments]    ${PASSWORD}
    Input Text     //*[@name='password']     ${PASSWORD}

*** Test Cases ***
Perform Web Automation
    Click Element    //a[@href='/products']
    Wait Until Page Contains Element    css:h2.title.text-center
    Wait Until Page Contains Element    //input[@name='search']
    Input Text    //input[@name='search']    Men 
    Click Button    //button[@type='button']
    Wait Until Page Contains Element    css:h2.title.text-center
    Click Element    //a[@class='btn btn-default add-to-cart']
    Click Element    css:a[href='/view_cart']
    Wait Until Page Contains    Men
    Click Element    //a[@href='/login']
    INPUT_EMAIL     ${EMAIL}
    INPUT_PASSWORD    ${PASSWORD}
    Click Button    //button[text()='Login']
    Click Element    //a[@href='/view_cart']
    Wait Until Page Contains    Men
    Close Browser
