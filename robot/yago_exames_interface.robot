*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${URL}                 http://localhost:3000/exames.html
${BROWSER}             chrome
${INPUT_NOME_EXAME}    id=nomeExame
${INPUT_DATA_EXAME}    id=dataExame
${INPUT_RESULTADO}     id=resultado
${BOTAO_REGISTRAR}     id=btnRegistrarExame
${LOCATOR_MENSAGEM}    id=mensagem

*** Test Cases ***
CT01 - Deve validar campos obrigatórios no registro de exame
    Abrir tela de exames
    Clicar em registrar exame
    Então deve exibir a mensagem    Todos os campos são obrigatórios
    Capture Page Screenshot    docs/yago-testes-interface/evidencias/ct01-exame-campos-obrigatorios.png

CT02 - Deve registrar exame com dados válidos
    Abrir tela de exames
    Informar nome do exame    Hemograma
    Informar data do exame    2026-05-31
    Informar resultado    Normal
    Clicar em registrar exame
    Então deve exibir a mensagem    Exame registrado com sucesso
    Capture Page Screenshot    docs/yago-testes-interface/evidencias/ct02-exame-valido.png

*** Keywords ***
Abrir tela de exames
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Informar nome do exame
    [Arguments]    ${nome}
    Input Text    ${INPUT_NOME_EXAME}    ${nome}

Informar data do exame
    [Arguments]    ${data}
    Input Text    ${INPUT_DATA_EXAME}    ${data}

Informar resultado
    [Arguments]    ${resultado}
    Input Text    ${INPUT_RESULTADO}    ${resultado}

Clicar em registrar exame
    Click Button    ${BOTAO_REGISTRAR}

Então deve exibir a mensagem
    [Arguments]    ${TEXTO_ESPERADO}
    Wait Until Element Contains    ${LOCATOR_MENSAGEM}    ${TEXTO_ESPERADO}    5s
    Element Text Should Be    ${LOCATOR_MENSAGEM}    ${TEXTO_ESPERADO}