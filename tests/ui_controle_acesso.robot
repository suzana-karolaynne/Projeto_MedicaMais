*** Settings ***
Library         SeleniumLibrary
Suite Teardown  Close Browser

*** Variables ***
${URL_LOGIN}           http://localhost:3000/login
${URL_DETALHES}        http://localhost:3000/sinais-vitais/125
${BROWSER}             chrome
${INPUT_EMAIL}         id=email
${INPUT_SENHA}         id=senha
${BOTAO_LOGIN}         id=btnLogin
${BOTAO_EXCLUIR}       id=btnExcluirRegistro
${MENSAGEM_SUCESSO}    id=toastMensagem

*** Test Cases ***
CT01 - Deve permitir exclusao para perfil Administrador
    Dado que o usuario loga no sistema como    admin@eduguard.com    senhaAdmin123
    E acessa a tela de detalhes do registro
    Quando clicar no botao de excluir
    Entao o sistema deve exibir a mensagem    Registro excluído com sucesso

CT02 - Deve ocultar botao de exclusao para perfil Secundario
    Dado que o usuario loga no sistema como    cuidador@eduguard.com    senhaCuidador123
    E acessa a tela de detalhes do registro
    Entao o botao de excluir nao deve estar visivel na interface

*** Keywords ***
Dado que o usuario loga no sistema como
    [Arguments]    ${email}    ${senha}
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${INPUT_EMAIL}    ${email}
    Input Password    ${INPUT_SENHA}    ${senha}
    Click Button    ${BOTAO_LOGIN}
    Sleep    2s

E acessa a tela de detalhes do registro
    Go To    ${URL_DETALHES}
    Wait Until Page Contains Element    id=cardSinalVital

Quando clicar no botao de excluir
    Click Button    ${BOTAO_EXCLUIR}
    Handle Alert    ACCEPT

Entao o sistema deve exibir a mensagem
    [Arguments]    ${mensagem}
    Wait Until Element Contains    ${MENSAGEM_SUCESSO}    ${mensagem}

Entao o botao de excluir nao deve estar visivel na interface
    Page Should Not Contain Element    ${BOTAO_EXCLUIR}