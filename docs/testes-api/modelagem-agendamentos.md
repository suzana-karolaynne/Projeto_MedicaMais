# Modelagem de Teste de API — Agendamentos

## Técnica utilizada

A técnica utilizada foi **Tabela de Decisão**.

Essa técnica foi escolhida porque o comportamento do endpoint depende da combinação de várias condições: especialidade preenchida, médico preenchido, data válida, hora válida e data futura.

## Endpoint testado

`POST /agendamentos`

## Objetivo do teste

Verificar se o endpoint de agendamentos responde corretamente para cenários de sucesso e falha, validando campos obrigatórios, formato de data/hora e regra de agendamento para data futura.

## Tabela de Decisão

| Condição / Regra | CT01 | CT02 | CT03 | CT04 |
|---|---|---|---|---|
| Especialidade preenchida | S | N | S | S |
| Médico preenchido | S | S | S | S |
| Data preenchida | S | S | S | S |
| Hora preenchida | S | S | S | S |
| Data e hora válidas | S | S | N | S |
| Data futura | S | S | - | N |
| Resultado esperado | Agendamento realizado com sucesso | Todos os campos são obrigatórios | Data ou hora inválida | A consulta deve ser agendada para uma data futura |

## Casos de Teste

### CT01 — Agendamento válido

```json
{
  "especialidade": "Cardiologia",
  "medico": "Dr. Carlos Silva",
  "data": "2026-12-10",
  "hora": "14:30"
}
```

Resultado esperado: `201 — Agendamento realizado com sucesso`.

### CT02 — Campo obrigatório ausente

```json
{
  "medico": "Dr. Carlos Silva",
  "data": "2026-12-10",
  "hora": "14:30"
}
```

Resultado esperado: `400 — Todos os campos são obrigatórios`.

### CT03 — Data inválida

```json
{
  "especialidade": "Cardiologia",
  "medico": "Dr. Carlos Silva",
  "data": "2026-99-99",
  "hora": "14:30"
}
```

Resultado esperado: `400 — Data ou hora inválida`.

### CT04 — Data no passado

```json
{
  "especialidade": "Cardiologia",
  "medico": "Dr. Carlos Silva",
  "data": "2024-01-10",
  "hora": "14:30"
}
```

Resultado esperado: `400 — A consulta deve ser agendada para uma data futura`.
