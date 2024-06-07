*** Settings ***
Resource    ../resources/base.resource

*** Test Cases ***
Deve poder remover o Darth Vader
    Start Session
    Get started

    Navigate to    Star Wars
    Go to item    Lista    Darth Vader

    ${positions}    Get Element Location    xpath=//android.widget.FrameLayout[@resource-id="com.qaxperience.yodapp:id/fragment"]//*[contains(@text, "@darthvader")]/../../..//*[contains(@resource-id, "indicator")]
    
    Log    message=${positions}    console=${True}

    ${start_x}     Set Variable    ${positions}[x]
    ${start_y}     Set Variable    ${positions}[y]
    ${offset_x}    Evaluate        ${positions}[x] - 750
    ${offset_y}    Set Variable    ${positions}[y]

    Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}    1000

    Click Element    com.qaxperience.yodapp:id/btnRemove
    Wait Until Page Does Not Contain    Darth Vader    5

    
    Close session