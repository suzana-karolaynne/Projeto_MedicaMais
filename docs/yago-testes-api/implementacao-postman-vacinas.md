# Implementação do Teste no Postman — Vacinas

Ferramenta

Postman.

Endpoint testado

POST http://localhost:3000/vacinas

Configuração da requisição
Item	Valor
Método	POST
URL	http://localhost:3000/vacinas
Body	raw / JSON
Header	Content-Type: application/json
Passo a passo
Abrir o Postman.
Criar uma nova requisição.
Selecionar o método POST.
Informar a URL http://localhost:3000/vacinas.
Acessar a aba Body.
Selecionar raw.
Selecionar JSON.
Informar o corpo da requisição.
Acessar a aba Scripts ou Tests.
Inserir os scripts de validação.
Clicar em Send.
Verificar o status code e a mensagem retornada.
CT01 — Vacina válida
Body
{
  "nomeVacina": "Influenza",
  "dataAplicacao": "2026-05-31",
  "dose": "Primeira dose"
}
Tests
pm.test("Status code deve ser 201", function () {
    pm.response.to.have.status(201);
});

pm.test("Mensagem deve ser Vacina registrada com sucesso", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Vacina registrada com sucesso");
});

