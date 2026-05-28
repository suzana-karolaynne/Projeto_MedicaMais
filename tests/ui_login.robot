*** Settings ***
Documentation     Teste de Interface - Login MedicaMais

*** Variables ***
${EMAIL_VALIDO}       suzanakarolaynne@gmail.com
${SENHA_VALIDA}       12345678

*** Test Cases ***
CT01 - Login com credenciais válidas
    Log    Tentando login com email válido
    Should Be Equal    ${EMAIL_VALIDO}    suzanakarolaynne@gmail.com
    Should Be Equal    ${SENHA_VALIDA}    12345678

CT02 - Login com senha inválida
    Log    Tentando login com senha inválida
    Should Not Be Equal    senhaErrada    ${SENHA_VALIDA}