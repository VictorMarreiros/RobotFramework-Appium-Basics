*** Settings ***
Resource    ../resources/base.resource

*** Test Cases ***

Deve selecionar a opção Python
    Start Session
    Get started
    Navigate to     Check e Radio
    Go to item      Botões de radio    Escolha sua linguagem preferida

    Click Element    xpath=//android.widget.RadioButton[contains(@text, "Python")]

    Sleep    5
    Close session