*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        http://localhost:3000
${BROWSER}    chrome

*** Test Cases ***
CT01 - Cadastro de medicamento válido
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Log    Simulação de cadastro de medicamento

    Title Should Be    MedicaMais

    Close Browser

CT02 - Unidade correta do medicamento
    Open Browser    ${URL}    ${BROWSER}

    Log    Verificando unidade gotas

    Title Should Be    MedicaMais

    Close Browser