# Relatório de Execução — Interface de Vacinas

Interface testada

Tela de Registro de Vacinas.

URL local:

http://localhost:3000/vacinas.html

Ambiente de testes
Item	Valor
Ferramenta	Robot Framework
Biblioteca	SeleniumLibrary
Navegador	Google Chrome
Ambiente	Localhost
Data de execução	31/05/2026
Comando utilizado
py -m robot -d docs/yago-testes-interface/resultados/vacinas robot/yago_vacinas_interface.robot
Resultados
Caso de Teste	Resultado Esperado	Resultado Obtido	Status
CT01 — Campos obrigatórios	Todos os campos são obrigatórios	Todos os campos são obrigatórios	Aprovado
CT02 — Vacina válida	Vacina registrada com sucesso	Vacina registrada com sucesso	Aprovado
Evidências
Arquivo	Descrição
docs/yago-testes-interface/resultados/vacinas/report.html	Relatório da execução
docs/yago-testes-interface/resultados/vacinas/log.html	Log detalhado
docs/yago-testes-interface/resultados/vacinas/output.xml	Resultado bruto
docs/yago-testes-interface/evidencias/ct01-vacina-campos-obrigatorios.png	Evidência do CT01
docs/yago-testes-interface/evidencias/ct02-vacina-valida.png	Evidência do CT02
Resumo
Total de testes	Aprovados	Reprovados
2	2	0
Conclusão

Os testes automatizados da tela de vacinas foram executados com sucesso usando Robot Framework e SeleniumLibrary.
