# Relatório de Execução — API de Agendamentos

## Endpoint testado

`POST /agendamentos`

## Ambiente de testes

| Item | Valor |
|---|---|
| Ferramenta | Postman |
| Ambiente | Local |
| Base URL | http://localhost:3000 |
| Data de execução | 31/05/2026 |

## Resultados

| Caso de Teste | Resultado Esperado | Resultado Obtido | Status |
|---|---|---|---|
| CT01 — Agendamento válido | 201 — Agendamento realizado com sucesso | 201 — Agendamento realizado com sucesso | Aprovado |
| CT02 — Campo obrigatório ausente | 400 — Todos os campos são obrigatórios | 400 — Todos os campos são obrigatórios | Aprovado |
| CT03 — Data inválida | 400 — Data ou hora inválida | 400 — Data ou hora inválida | Aprovado |
| CT04 — Data no passado | 400 — A consulta deve ser agendada para uma data futura | 400 — A consulta deve ser agendada para uma data futura | Aprovado |

## Evidências

### CT01 — Agendamento válido

![CT01 — Agendamento válido](evidencias/ct01-agendamento-valido.png)

### CT02 — Campo obrigatório ausente

![CT02 — Campo obrigatório ausente](evidencias/ct02-agendamento-campo-obrigatorio.png)

### CT03 — Data inválida

![CT03 — Data inválida](evidencias/ct03-agendamento-data-invalida.png)

### CT04 — Data no passado

![CT04 — Data no passado](evidencias/ct04-agendamento-data-passada.png)

## Resumo dos resultados

| Total de testes | Aprovados | Reprovados |
|---|---|---|
| 4 | 4 | 0 |

## Conclusão

Os testes executados no endpoint de agendamentos apresentaram conformidade com o comportamento esperado. O endpoint validou corretamente os campos obrigatórios, datas inválidas, datas passadas e o cenário de agendamento válido.
