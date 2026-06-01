# Implementação do Teste no Postman — Exames

Ferramenta

Postman.

Endpoint testado

POST http://localhost:3000/exames

Configuração da requisição
Item	Valor
Método	POST
URL	http://localhost:3000/exames
Body	raw / JSON
Header	Content-Type: application/json
Passo a passo
Abrir o Postman.
Criar uma nova requisição.
Selecionar o método POST.
Informar a URL http://localhost:3000/exames.
Acessar a aba Body.
Selecionar raw.
Selecionar JSON.
Informar o corpo da requisição.
Acessar a aba Scripts ou Tests.
Inserir os scripts de validação.
Clicar em Send.
Verificar o status code e a mensagem retornada.
CT01 — Exame válido
Body
{
  "nomeExame": "Hemograma",
  "dataExame": "2026-05-31",
  "resultado": "Normal"
}
Tests
pm.test("Status code deve ser 201", function () {
    pm.response.to.have.status(201);
});

pm.test("Mensagem deve ser Exame registrado com sucesso", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Exame registrado com sucesso");
});

