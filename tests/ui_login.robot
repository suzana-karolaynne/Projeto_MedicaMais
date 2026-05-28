*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        http://localhost:3000
${BROWSER}    chrome

*** Test Cases ***
CT01 - Login válido
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Log    Simulação de login válido

    Title Should Be    MedicaMais

    Close Browser

CT02 - Login inválido
    Open Browser    ${URL}    ${BROWSER}

    Log    Simulação de login inválido

    Title Should Be    MedicaMais

    Close Browser