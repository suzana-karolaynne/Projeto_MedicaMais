# Modelagem de Teste de API — Sinais Vitais

## Técnica utilizada

A técnica utilizada foi **Particionamento de Equivalência**.

Essa técnica foi escolhida porque os valores dos sinais vitais podem ser divididos em grupos válidos e inválidos.

## Endpoint testado

`POST /sinais-vitais`

## Objetivo do teste

Verificar se o endpoint de sinais vitais valida corretamente campos obrigatórios e faixas permitidas para temperatura, frequência cardíaca e saturação de oxigênio.

## Partições de Equivalência

| Partição | Descrição | Resultado Esperado |
|---|---|---|
| P1 | Todos os campos válidos | Sinais vitais registrados com sucesso |
| P2 | Campo obrigatório ausente | Todos os campos são obrigatórios |
| P3 | Temperatura menor que 35 ou maior que 42 | Temperatura fora da faixa permitida |
| P4 | Frequência cardíaca menor que 40 ou maior que 180 | Frequência cardíaca fora da faixa permitida |
| P5 | Saturação menor que 70 ou maior que 100 | Saturação de oxigênio fora da faixa permitida |

## Casos de Teste

### CT01 — Dados válidos

```json
{
  "pressaoArterial": "120/80",
  "temperatura": 36.5,
  "frequenciaCardiaca": 80,
  "saturacaoOxigenio": 98
}
```

Resultado esperado: `201 — Sinais vitais registrados com sucesso`.

### CT02 — Campo obrigatório ausente

```json
{
  "temperatura": 36.5,
  "frequenciaCardiaca": 80,
  "saturacaoOxigenio": 98
}
```

Resultado esperado: `400 — Todos os campos são obrigatórios`.

### CT03 — Temperatura inválida

```json
{
  "pressaoArterial": "120/80",
  "temperatura": 44,
  "frequenciaCardiaca": 80,
  "saturacaoOxigenio": 98
}
```

Resultado esperado: `400 — Temperatura fora da faixa permitida`.

### CT04 — Frequência cardíaca inválida

```json
{
  "pressaoArterial": "120/80",
  "temperatura": 36.5,
  "frequenciaCardiaca": 200,
  "saturacaoOxigenio": 98
}
```

Resultado esperado: `400 — Frequência cardíaca fora da faixa permitida`.

### CT05 — Saturação inválida

```json
{
  "pressaoArterial": "120/80",
  "temperatura": 36.5,
  "frequenciaCardiaca": 80,
  "saturacaoOxigenio": 60
}
```

Resultado esperado: `400 — Saturação de oxigênio fora da faixa permitida`.
