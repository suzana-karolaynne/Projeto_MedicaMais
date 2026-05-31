*** Settings ***
Library    SeleniumLibrary
Suite Setup       Open Browser    http://127.0.0.1:5500/public/sinais_vitais.html    chrome
Suite Teardown    Close Browser

*** Test Cases ***
CT01 - Salvar sinais com sucesso
    Input Text    id=pressao    120x80
    Input Text    id=temperatura    36.5
    Input Text    id=frequencia    75
    Input Text    id=saturacao    98
    Click Button    id=btnSalvar
    Wait Until Element Contains    id=mensagem    Salvo com sucesso    timeout=5s

CT02 - Temperatura fora do limite
    Input Text    id=pressao    120x80
    Input Text    id=temperatura    45.0
    Input Text    id=frequencia    80
    Input Text    id=saturacao    95
    Click Button    id=btnSalvar
    Wait Until Element Contains    id=mensagem    Temperatura inválida    timeout=5s