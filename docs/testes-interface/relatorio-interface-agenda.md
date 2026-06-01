\# Relatório de Execução — Teste de Interface da Agenda



\## Interface testada



Tela de Agendamento de Consulta



URL local:



http://localhost:3000/agenda.html



\## Ambiente de testes



| Item | Valor |

|---|---|

| Ferramenta | Robot Framework |

| Biblioteca | SeleniumLibrary |

| Navegador | Google Chrome |

| Ambiente | Localhost |

| Data de execução | 31/05/2026 |



\## Comando utilizado



```bash

py -m robot -d docs/testes-interface/resultados/agenda robot/agenda\_interface\_yago.robot

```



\## Resultados



| Caso de Teste | Resultado Esperado | Resultado Obtido | Status |

|---|---|---|---|

| CT01 — Campos obrigatórios vazios | Por favor, preencha todos os campos. | Por favor, preencha todos os campos. | Aprovado |

| CT02 — Médico obrigatório vazio | Por favor, preencha todos os campos. | Por favor, preencha todos os campos. | Aprovado |



\## Evidências geradas



| Arquivo | Descrição |

|---|---|

| docs/testes-interface/resultados/agenda/report.html | Relatório da execução |

| docs/testes-interface/resultados/agenda/log.html | Log detalhado |

| docs/testes-interface/resultados/agenda/output.xml | Resultado bruto |

| docs/testes-interface/evidencias/ct01-agenda-campos-obrigatorios.png | Evidência do CT01 |

| docs/testes-interface/evidencias/ct02-agenda-medico-obrigatorio.png | Evidência do CT02 |



\## Resumo



| Total de testes | Aprovados | Reprovados |

|---|---|---|

| 2 | 2 | 0 |



\## Conclusão



Os testes automatizados da tela de agenda foram executados com sucesso. A interface apresentou a mensagem esperada quando campos obrigatórios não foram preenchidos.

