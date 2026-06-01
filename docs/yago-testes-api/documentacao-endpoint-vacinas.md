# Documentação do Endpoint — Vacinas

Endpoint

POST /vacinas

Descrição

Endpoint responsável por registrar vacinas no sistema MedicaMais.

Base URL

http://localhost:3000

Headers
Key	Value
Content-Type	application/json
Body da requisição
{
  "nomeVacina": "string",
  "dataAplicacao": "YYYY-MM-DD",
  "dose": "string"
}
Campos
Campo	Tipo	Obrigatório	Descrição
nomeVacina	string	Sim	Nome da vacina
dataAplicacao	string	Sim	Data de aplicação da vacina
dose	string	Sim	Dose aplicada
Respostas
201 — Vacina registrada com sucesso
{
  "mensagem": "Vacina registrada com sucesso",
  "vacina": {
    "nomeVacina": "Influenza",
    "dataAplicacao": "2026-05-31",
    "dose": "Primeira dose"
  }
}
400 — Todos os campos são obrigatórios
{
  "mensagem": "Todos os campos são obrigatórios"
}
400 — Data de aplicação inválida
{
  "mensagem": "Data de aplicação inválida"
}

