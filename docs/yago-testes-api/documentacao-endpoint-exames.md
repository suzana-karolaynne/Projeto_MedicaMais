# Documentação do Endpoint — Exames

Endpoint

POST /exames

Descrição

Endpoint responsável por registrar exames no sistema MedicaMais.

Base URL

http://localhost:3000

Headers
Key	Value
Content-Type	application/json
Body da requisição
{
  "nomeExame": "string",
  "dataExame": "YYYY-MM-DD",
  "resultado": "string"
}
Campos
Campo	Tipo	Obrigatório	Descrição
nomeExame	string	Sim	Nome do exame
dataExame	string	Sim	Data de realização do exame
resultado	string	Sim	Resultado do exame
Respostas
201 — Exame registrado com sucesso
{
  "mensagem": "Exame registrado com sucesso",
  "exame": {
    "nomeExame": "Hemograma",
    "dataExame": "2026-05-31",
    "resultado": "Normal"
  }
}
400 — Todos os campos são obrigatórios
{
  "mensagem": "Todos os campos são obrigatórios"
}
400 — Data do exame inválida
{
  "mensagem": "Data do exame inválida"
}

