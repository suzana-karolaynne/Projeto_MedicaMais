# Modelagem de Teste de Interface — Agenda

## Técnica utilizada

A técnica utilizada foi Tabela de Decisão.

Essa técnica foi escolhida porque o comportamento da tela depende da combinação entre campos preenchidos e campos obrigatórios ausentes.

## Interface testada

Tela de Agendamento de Consulta

URL local:

http://localhost:3000/agenda.html

## Objetivo do teste

Verificar se a tela de agenda valida corretamente os campos obrigatórios antes de permitir o agendamento.

## Tabela de Decisão

| Condição / Regra | CT01 | CT02 |
|---|---|---|
| Especialidade preenchida | N | S |
| Médico preenchido | N | N |
| Data preenchida | N | S |
| Hora preenchida | N | S |
| Resultado esperado | Por favor, preencha todos os campos. | Por favor, preencha todos os campos. |

## Casos de Teste

### CT01 — Campos obrigatórios vazios

Ação:

- Acessar a tela de agenda.
- Clicar no botão de agendar sem preencher os campos.

Resultado esperado:

```text
Por favor, preencha todos os campos.
```

### CT02 — Médico obrigatório vazio

Ação:

- Acessar a tela de agenda.
- Selecionar a especialidade Cardiologia.
- Informar a data 2026-12-10.
- Informar a hora 14:30.
- Deixar o campo médico vazio.
- Clicar no botão de agendar.

Resultado esperado:

```text
Por favor, preencha todos os campos.
```