# Documentação do Endpoint — Agendamentos

## Endpoint

`POST /agendamentos`

## Descrição

Endpoint responsável por realizar o agendamento de uma consulta no sistema MedicaMais.

## Base URL

`http://localhost:3000`

## Headers

| Key | Value |
|---|---|
| Content-Type | application/json |

## Body da requisição

```json
{
  "especialidade": "string",
  "medico": "string",
  "data": "YYYY-MM-DD",
  "hora": "HH:mm"
}
```

## Campos

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| especialidade | string | Sim | Especialidade da consulta |
| medico | string | Sim | Nome do médico |
| data | string | Sim | Data da consulta |
| hora | string | Sim | Hora da consulta |

## Respostas

### 201 — Agendamento realizado com sucesso

```json
{
  "mensagem": "Agendamento realizado com sucesso",
  "agendamento": {
    "especialidade": "Cardiologia",
    "medico": "Dr. Carlos Silva",
    "data": "2026-12-10",
    "hora": "14:30"
  }
}
```

### 400 — Todos os campos são obrigatórios

```json
{
  "mensagem": "Todos os campos são obrigatórios"
}
```

### 400 — Data ou hora inválida

```json
{
  "mensagem": "Data ou hora inválida"
}
```

### 400 — A consulta deve ser agendada para uma data futura

```json
{
  "mensagem": "A consulta deve ser agendada para uma data futura"
}
```
