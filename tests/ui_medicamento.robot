*** Settings ***
Documentation     Teste de Interface - Cadastro de Medicamento

*** Variables ***
${MEDICAMENTO}    Dipirona
${DOSE}           20
${UNIDADE}        gotas

*** Test Cases ***
CT01 - Cadastro válido de medicamento
    Log    Validando cadastro de medicamento
    Should Be Equal    ${MEDICAMENTO}    Dipirona
    Should Be Equal As Numbers    ${DOSE}    20

CT02 - Unidade correta
    Log    Validando unidade do medicamento
    Should Be Equal    ${UNIDADE}    gotas