# Documentação do Endpoint — Sinais Vitais

## Endpoint

`POST /sinais-vitais`

## Descrição

Endpoint responsável por registrar os sinais vitais de um usuário no sistema MedicaMais.

## Base URL

`http://localhost:3000`

## Headers

| Key | Value |
|---|---|
| Content-Type | application/json |

## Body da requisição

```json
{
  "pressaoArterial": "string",
  "temperatura": "number",
  "frequenciaCardiaca": "number",
  "saturacaoOxigenio": "number"
}
```

## Campos

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| pressaoArterial | string | Sim | Pressão arterial do usuário |
| temperatura | number | Sim | Temperatura corporal |
| frequenciaCardiaca | number | Sim | Frequência cardíaca |
| saturacaoOxigenio | number | Sim | Saturação de oxigênio |

## Respostas

### 201 — Sinais vitais registrados com sucesso

```json
{
  "mensagem": "Sinais vitais registrados com sucesso",
  "sinaisVitais": {
    "pressaoArterial": "120/80",
    "temperatura": 36.5,
    "frequenciaCardiaca": 80,
    "saturacaoOxigenio": 98
  }
}
```

### 400 — Todos os campos são obrigatórios

```json
{
  "mensagem": "Todos os campos são obrigatórios"
}
```

### 400 — Temperatura fora da faixa permitida

```json
{
  "mensagem": "Temperatura fora da faixa permitida"
}
```

### 400 — Frequência cardíaca fora da faixa permitida

```json
{
  "mensagem": "Frequência cardíaca fora da faixa permitida"
}
```

### 400 — Saturação de oxigênio fora da faixa permitida

```json
{
  "mensagem": "Saturação de oxigênio fora da faixa permitida"
}
```
