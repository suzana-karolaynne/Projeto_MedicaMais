*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${URL}                http://localhost:3000/sinais_vitais.html
${BROWSER}            chrome
${INPUT_PRESSAO}      id=pressao
${INPUT_TEMPERATURA}  id=temperatura
${INPUT_FREQUENCIA}   id=frequencia
${INPUT_SATURACAO}    id=saturacao
${BOTAO_SALVAR}       id=btnSalvar
${LOCATOR_MENSAGEM}   id=mensagem

*** Test Cases ***
CT01 - Deve validar pressão e temperatura obrigatórias
    Abrir tela de sinais vitais
    Clicar em registrar sinais
    Então deve exibir a mensagem    Pressão e temperatura são obrigatórios.
    Capture Page Screenshot    docs/testes-interface/evidencias/ct01-sinais-pressao-temperatura-obrigatorias.png

CT02 - Deve validar temperatura obrigatória
    Abrir tela de sinais vitais
    Informar pressão arterial    120x80
    Clicar em registrar sinais
    Então deve exibir a mensagem    Pressão e temperatura são obrigatórios.
    Capture Page Screenshot    docs/testes-interface/evidencias/ct02-sinais-temperatura-obrigatoria.png

*** Keywords ***
Abrir tela de sinais vitais
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Informar pressão arterial
    [Arguments]    ${pressao}
    Input Text    ${INPUT_PRESSAO}    ${pressao}

Clicar em registrar sinais
    Click Button    ${BOTAO_SALVAR}

Então deve exibir a mensagem
    [Arguments]    ${TEXTO_ESPERADO}
    Wait Until Element Contains    ${LOCATOR_MENSAGEM}    ${TEXTO_ESPERADO}    5s
    Element Text Should Be    ${LOCATOR_MENSAGEM}    ${TEXTO_ESPERADO}