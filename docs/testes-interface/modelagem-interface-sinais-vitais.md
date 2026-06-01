\# Modelagem de Teste de Interface — Sinais Vitais



\## Técnica utilizada



A técnica utilizada foi Particionamento de Equivalência.



Essa técnica foi escolhida porque os campos da tela podem ser separados em grupos de entrada válida e inválida, principalmente considerando campos obrigatórios ausentes.



\## Interface testada



Tela de Sinais Vitais



URL local:



http://localhost:3000/sinais\_vitais.html



\## Objetivo do teste



Verificar se a tela de sinais vitais valida corretamente os campos obrigatórios de pressão arterial e temperatura.



\## Partições de Equivalência



| Partição | Descrição | Resultado Esperado |

|---|---|---|

| P1 | Pressão e temperatura ausentes | Pressão e temperatura são obrigatórios. |

| P2 | Pressão preenchida e temperatura ausente | Pressão e temperatura são obrigatórios. |



\## Casos de Teste



\### CT01 — Pressão e temperatura obrigatórias



Ação:



\- Acessar a tela de sinais vitais.

\- Clicar no botão de salvar sem preencher os campos.



Resultado esperado:



```text

Pressão e temperatura são obrigatórios.

```



\### CT02 — Temperatura obrigatória



Ação:



\- Acessar a tela de sinais vitais.

\- Informar pressão arterial 120x80.

\- Deixar o campo temperatura vazio.

\- Clicar no botão de salvar.



Resultado esperado:



```text

Pressão e temperatura são obrigatórios.

```

