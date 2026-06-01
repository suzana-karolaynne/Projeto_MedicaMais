# Implementação do Teste no Postman — Agendamentos

## Ferramenta utilizada

Postman

## Endpoint testado

`POST http://localhost:3000/agendamentos`

## Configuração inicial

Antes da execução dos testes, o servidor foi iniciado localmente com o comando:

```bash
npm start
```

## Configuração da requisição

| Item | Valor |
|---|---|
| Método | POST |
| URL | http://localhost:3000/agendamentos |
| Header | Content-Type: application/json |

## Passo a passo

1. Abrir o Postman.
2. Criar uma requisição HTTP.
3. Selecionar o método `POST`.
4. Informar a URL `http://localhost:3000/agendamentos`.
5. Acessar a aba `Body`.
6. Selecionar `raw`.
7. Selecionar o formato `JSON`.
8. Inserir o corpo da requisição.
9. Acessar a aba `Scripts` ou `Tests`.
10. Inserir os scripts de validação.
11. Clicar em `Send`.
12. Verificar o status code, o body da resposta e o resultado dos testes.

## CT01 — Agendamento válido

### Body

```json
{
  "especialidade": "Cardiologia",
  "medico": "Dr. Carlos Silva",
  "data": "2026-12-10",
  "hora": "14:30"
}
```

### Tests

```javascript
pm.test("Status code deve ser 201", function () {
    pm.response.to.have.status(201);
});

pm.test("Mensagem deve ser Agendamento realizado com sucesso", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Agendamento realizado com sucesso");
});
```

## CT02 — Campo obrigatório ausente

### Body

```json
{
  "medico": "Dr. Carlos Silva",
  "data": "2026-12-10",
  "hora": "14:30"
}
```

### Tests

```javascript
pm.test("Status code deve ser 400", function () {
    pm.response.to.have.status(400);
});

pm.test("Mensagem deve informar campos obrigatórios", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Todos os campos são obrigatórios");
});
```

## CT03 — Data inválida

### Body

```json
{
  "especialidade": "Cardiologia",
  "medico": "Dr. Carlos Silva",
  "data": "2026-99-99",
  "hora": "14:30"
}
```

### Tests

```javascript
pm.test("Status code deve ser 400", function () {
    pm.response.to.have.status(400);
});

pm.test("Mensagem deve informar data ou hora inválida", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Data ou hora inválida");
});
```

## CT04 — Data no passado

### Body

```json
{
  "especialidade": "Cardiologia",
  "medico": "Dr. Carlos Silva",
  "data": "2024-01-10",
  "hora": "14:30"
}
```

### Tests

```javascript
pm.test("Status code deve ser 400", function () {
    pm.response.to.have.status(400);
});

pm.test("Mensagem deve informar data futura", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("A consulta deve ser agendada para uma data futura");
});
```
