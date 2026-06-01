*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${URL}                     http://localhost:3000/agenda.html
${BROWSER}                 chrome
${SELECT_ESPECIALIDADE}    id=especialidade
${INPUT_MEDICO}            id=medico
${INPUT_DATA}              id=data
${INPUT_HORA}              id=hora
${BOTAO_AGENDAR}           id=btnAgendar
${LOCATOR_MENSAGEM}        id=mensagem

*** Test Cases ***
CT01 - Deve validar campos obrigatórios na tela de agenda
    Abrir tela de agenda
    Clicar em confirmar agendamento
    Então deve exibir a mensagem    Por favor, preencha todos os campos.
    Capture Page Screenshot    docs/testes-interface/evidencias/ct01-agenda-campos-obrigatorios.png

CT02 - Deve validar médico obrigatório na tela de agenda
    Abrir tela de agenda
    Selecionar especialidade    Cardiologia
    Informar data    2026-12-10
    Informar hora    14:30
    Clicar em confirmar agendamento
    Então deve exibir a mensagem    Por favor, preencha todos os campos.
    Capture Page Screenshot    docs/testes-interface/evidencias/ct02-agenda-medico-obrigatorio.png

*** Keywords ***
Abrir tela de agenda
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Selecionar especialidade
    [Arguments]    ${especialidade}
    Select From List By Label    ${SELECT_ESPECIALIDADE}    ${especialidade}

Informar data
    [Arguments]    ${data}
    Input Text    ${INPUT_DATA}    ${data}

Informar hora
    [Arguments]    ${hora}
    Input Text    ${INPUT_HORA}    ${hora}

Clicar em confirmar agendamento
    Click Button    ${BOTAO_AGENDAR}

Então deve exibir a mensagem
    [Arguments]    ${TEXTO_ESPERADO}
    Wait Until Element Contains    ${LOCATOR_MENSAGEM}    ${TEXTO_ESPERADO}    5s
    Element Text Should Be    ${LOCATOR_MENSAGEM}    ${TEXTO_ESPERADO}