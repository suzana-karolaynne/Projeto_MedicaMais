# Modelagem de Teste de API — Vacinas

## Técnica utilizada

Particionamento de Equivalência.

## Endpoint testado

POST /vacinas

## Objetivo do teste

Verificar se o endpoint de vacinas valida corretamente dados válidos, campos obrigatórios ausentes e data inválida.

## Partições de Equivalência

| Partição | Descrição | Resultado Esperado |
|---|---|---|
| P1 | Dados válidos | Vacina registrada com sucesso |
| P2 | Campo obrigatório ausente | Todos os campos são obrigatórios |
| P3 | Data inválida | Data de aplicação inválida |

## Casos de Teste

### CT01 — Vacina válida

```json
{
  "nomeVacina": "Influenza",
  "dataAplicacao": "2026-05-31",
  "dose": "Primeira dose"
}

Resultado esperado:

201 — Vacina registrada com sucesso.

CT02 — Campo obrigatório ausente
{
  "nomeVacina": "Influenza",
  "dataAplicacao": "2026-05-31"
}

Resultado esperado:

400 — Todos os campos são obrigatórios.

CT03 — Data inválida
{
  "nomeVacina": "Influenza",
  "dataAplicacao": "2026-99-99",
  "dose": "Primeira dose"
}

Resultado esperado:

400 — Data de aplicação inválida.
