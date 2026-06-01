\# Relatório de Execução — Teste de Interface de Sinais Vitais



\## Interface testada



Tela de Sinais Vitais



URL local:



http://localhost:3000/sinais\_vitais.html



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

py -m robot -d docs/testes-interface/resultados/sinais-vitais robot/sinais\_vitais\_interface\_yago.robot

```



\## Resultados



| Caso de Teste | Resultado Esperado | Resultado Obtido | Status |

|---|---|---|---|

| CT01 — Pressão e temperatura obrigatórias | Pressão e temperatura são obrigatórios. | Pressão e temperatura são obrigatórios. | Aprovado |

| CT02 — Temperatura obrigatória | Pressão e temperatura são obrigatórios. | Pressão e temperatura são obrigatórios. | Aprovado |



\## Evidências geradas



| Arquivo | Descrição |

|---|---|

| docs/testes-interface/resultados/sinais-vitais/report.html | Relatório da execução |

| docs/testes-interface/resultados/sinais-vitais/log.html | Log detalhado |

| docs/testes-interface/resultados/sinais-vitais/output.xml | Resultado bruto |

| docs/testes-interface/evidencias/ct01-sinais-pressao-temperatura-obrigatorias.png | Evidência do CT01 |

| docs/testes-interface/evidencias/ct02-sinais-temperatura-obrigatoria.png | Evidência do CT02 |



\## Resumo



| Total de testes | Aprovados | Reprovados |

|---|---|---|

| 2 | 2 | 0 |



\## Conclusão



Os testes automatizados da tela de sinais vitais foram executados com sucesso. A interface apresentou a mensagem esperada nos cenários de campos obrigatórios ausentes.

