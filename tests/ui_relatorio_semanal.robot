Language: pt-BR

*** Configurações ***
Library         SeleniumLibrary
Suite Setup     Dado que o usuario acessa a tela de relatorios
Suite Teardown  E fecha o navegador

*** Variáveis ***
${URL}                 http://localhost:3000/relatorios
${BROWSER}             chrome
${INPUT_DATA_INICIO}   id=dataInicio
${INPUT_DATA_FIM}      id=dataFim
${BOTAO_GERAR}         id=btnGerarRelatorio
${MENSAGEM_ERRO}       id=mensagemErro
${TABELA_RESULTADOS}   id=tabelaMetricas

*** Casos de Teste ***
CT01 - Deve processar relatorio com intervalo de 0 dias (mesmo dia)
    Dado que o usuario informa a data inicial    2026-06-01
    E informa a data final    2026-06-01
    Quando solicitar a geracao do relatorio
    Entao o sistema deve exibir a tabela de resultados

CT02 - Deve processar relatorio com intervalo de 1 a 7 dias
    Dado que o usuario informa a data inicial    2026-05-25
    E informa a data final    2026-06-01
    Quando solicitar a geracao do relatorio
    Entao o sistema deve exibir a tabela de resultados

CT03 - Deve bloquear relatorio com 8 ou mais dias
    Dado que o usuario informa a data inicial    2026-05-20
    E informa a data final    2026-06-01
    Quando solicitar a geracao do relatorio
    Entao o sistema deve apresentar a mensagem de erro    Período máximo de 7 dias

*** Palavras-Chave ***
Dado que o usuario acessa a tela de relatorios
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Dado que o usuario informa a data inicial
    [Arguments]    ${data}
    Input Text    ${INPUT_DATA_INICIO}    ${data}

E informa a data final
    [Arguments]    ${data}
    Input Text    ${INPUT_DATA_FIM}    ${data}

Quando solicitar a geracao do relatorio
    Click Button    ${BOTAO_GERAR}

Entao o sistema deve apresentar a mensagem de erro
    [Arguments]    ${mensagem}
    Element Text Should Be    ${MENSAGEM_ERRO}    ${mensagem}

Entao o sistema deve exibir a tabela de resultados
    Element Should Be Visible    ${TABELA_RESULTADOS}

E fecha o navegador
    Close Browser
