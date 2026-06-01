*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${URL}                    http://localhost:3000/vacinas.html
${BROWSER}                chrome
${INPUT_NOME_VACINA}      id=nomeVacina
${INPUT_DATA_APLICACAO}   id=dataAplicacao
${INPUT_DOSE}             id=dose
${BOTAO_REGISTRAR}        id=btnRegistrarVacina
${LOCATOR_MENSAGEM}       id=mensagem

*** Test Cases ***
CT01 - Deve validar campos obrigatórios no registro de vacina
    Abrir tela de vacinas
    Clicar em registrar vacina
    Então deve exibir a mensagem    Todos os campos são obrigatórios
    Capture Page Screenshot    docs/yago-testes-interface/evidencias/ct01-vacina-campos-obrigatorios.png

CT02 - Deve registrar vacina com dados válidos
    Abrir tela de vacinas
    Informar nome da vacina    Influenza
    Informar data de aplicação    2026-05-31
    Informar dose    Primeira dose
    Clicar em registrar vacina
    Então deve exibir a mensagem    Vacina registrada com sucesso
    Capture Page Screenshot    docs/yago-testes-interface/evidencias/ct02-vacina-valida.png

*** Keywords ***
Abrir tela de vacinas
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Informar nome da vacina
    [Arguments]    ${nome}
    Input Text    ${INPUT_NOME_VACINA}    ${nome}

Informar data de aplicação
    [Arguments]    ${data}
    Input Text    ${INPUT_DATA_APLICACAO}    ${data}

Informar dose
    [Arguments]    ${dose}
    Input Text    ${INPUT_DOSE}    ${dose}

Clicar em registrar vacina
    Click Button    ${BOTAO_REGISTRAR}

Então deve exibir a mensagem
    [Arguments]    ${TEXTO_ESPERADO}
    Wait Until Element Contains    ${LOCATOR_MENSAGEM}    ${TEXTO_ESPERADO}    5s
    Element Text Should Be    ${LOCATOR_MENSAGEM}    ${TEXTO_ESPERADO}