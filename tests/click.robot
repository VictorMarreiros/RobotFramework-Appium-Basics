*** Settings ***
Resource    ../resources/base.resource

*** Test Cases ***

Deve realizar um click simples
    [Tags]    simple-click
    Start Session
    Get started
    Navigate to     Clique em Botões
    Go to item     Clique simples    Botão clique simples

    Click Text                      CLIQUE SIMPLES
    Wait Until Page Contains        Isso é um clique simples    10
    
    Close session


Deve realizar um click longo
    [Tags]    long-click

    Start Session
    Get started
    Navigate to     Clique em Botões
    Go to item     Clique longo    Botão clique longo

    # Pegando as coordenadas do botão
    ${locator}        Set Variable    id=com.qaxperience.yodapp:id/long_click
    ${positions}      Get Element Location    ${locator} 
   
    # Fazendo um click longo usando as coordenadas obtidas através do id do elemento
    Tap With Positions    1000    ${${positions}[x], ${positions}[y]}
    Wait Until Page Contains        Isso é um clique longo    10
    
    Close session
