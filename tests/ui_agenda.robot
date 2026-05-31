*** Settings ***
Library    SeleniumLibrary
Suite Setup       Open Browser    http://127.0.0.1:5500/public/agenda.html    chrome
Suite Teardown    Close Browser

*** Test Cases ***
CT01 - Agendar consulta válida
    Select From List By Label    id=especialidade    Cardiologia
    Input Text    id=medico    Dr. João
    Input Text    id=data    15122026
    Input Text    id=hora    1430
    Click Button    id=btnAgendar
    Wait Until Element Contains    id=mensagem    Consulta agendada    timeout=5s

CT02 - Agendar data no passado
    Select From List By Label    id=especialidade    Clínico Geral
    Input Text    id=medico    Dra. Maria
    Input Text    id=data    01012020
    Input Text    id=hora    0900
    Click Button    id=btnAgendar
    Wait Until Element Contains    id=mensagem    Data inválida    timeout=5s