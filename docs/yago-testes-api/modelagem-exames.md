# Modelagem de Teste de API — Exames

Técnica utilizada

Tabela de Decisão.

Endpoint testado

POST /exames

Objetivo do teste

Verificar se o endpoint de exames responde corretamente aos cenários de registro válido, campos ausentes e data inválida.

Tabela de Decisão
Condição / Regra	CT01	CT02	CT03
Nome do exame preenchido	S	S	S
Data preenchida	S	S	S
Resultado preenchido	S	N	S
Data válida	S	S	N
Resultado esperado	Exame registrado com sucesso	Todos os campos são obrigatórios	Data do exame inválida
Casos de Teste
CT01 — Exame válido
{
  "nomeExame": "Hemograma",
  "dataExame": "2026-05-31",
  "resultado": "Normal"
}

Resultado esperado:

201 — Exame registrado com sucesso.

CT02 — Campo obrigatório ausente
{
  "nomeExame": "Hemograma",
  "dataExame": "2026-05-31"
}

Resultado esperado:

400 — Todos os campos são obrigatórios.

CT03 — Data inválida
{
  "nomeExame": "Hemograma",
  "dataExame": "2026-99-99",
  "resultado": "Normal"
}

Resultado esperado:

400 — Data do exame inválida.
