# Implementação do Teste no Postman — Sinais Vitais

## Ferramenta utilizada

Postman

## Endpoint testado

`POST http://localhost:3000/sinais-vitais`

## Configuração inicial

Antes da execução dos testes, o servidor foi iniciado localmente com o comando:

```bash
npm start
```

## Configuração da requisição

| Item | Valor |
|---|---|
| Método | POST |
| URL | http://localhost:3000/sinais-vitais |
| Header | Content-Type: application/json |

## Passo a passo

1. Abrir o Postman.
2. Criar uma requisição HTTP.
3. Selecionar o método `POST`.
4. Informar a URL `http://localhost:3000/sinais-vitais`.
5. Acessar a aba `Body`.
6. Selecionar `raw`.
7. Selecionar o formato `JSON`.
8. Inserir o corpo da requisição.
9. Acessar a aba `Scripts` ou `Tests`.
10. Inserir os scripts de validação.
11. Clicar em `Send`.
12. Verificar o status code, o body da resposta e o resultado dos testes.

## CT01 — Dados válidos

### Body

```json
{
  "pressaoArterial": "120/80",
  "temperatura": 36.5,
  "frequenciaCardiaca": 80,
  "saturacaoOxigenio": 98
}
```

### Tests

```javascript
pm.test("Status code deve ser 201", function () {
    pm.response.to.have.status(201);
});

pm.test("Mensagem deve ser Sinais vitais registrados com sucesso", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Sinais vitais registrados com sucesso");
});
```

## CT02 — Campo obrigatório ausente

### Body

```json
{
  "temperatura": 36.5,
  "frequenciaCardiaca": 80,
  "saturacaoOxigenio": 98
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

## CT03 — Temperatura inválida

### Body

```json
{
  "pressaoArterial": "120/80",
  "temperatura": 44,
  "frequenciaCardiaca": 80,
  "saturacaoOxigenio": 98
}
```

### Tests

```javascript
pm.test("Status code deve ser 400", function () {
    pm.response.to.have.status(400);
});

pm.test("Mensagem deve informar temperatura inválida", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Temperatura fora da faixa permitida");
});
```

## CT04 — Frequência cardíaca inválida

### Body

```json
{
  "pressaoArterial": "120/80",
  "temperatura": 36.5,
  "frequenciaCardiaca": 200,
  "saturacaoOxigenio": 98
}
```

### Tests

```javascript
pm.test("Status code deve ser 400", function () {
    pm.response.to.have.status(400);
});

pm.test("Mensagem deve informar frequência cardíaca inválida", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Frequência cardíaca fora da faixa permitida");
});
```

## CT05 — Saturação inválida

### Body

```json
{
  "pressaoArterial": "120/80",
  "temperatura": 36.5,
  "frequenciaCardiaca": 80,
  "saturacaoOxigenio": 60
}
```

### Tests

```javascript
pm.test("Status code deve ser 400", function () {
    pm.response.to.have.status(400);
});

pm.test("Mensagem deve informar saturação inválida", function () {
    var json = pm.response.json();
    pm.expect(json.mensagem).to.eql("Saturação de oxigênio fora da faixa permitida");
});
```
