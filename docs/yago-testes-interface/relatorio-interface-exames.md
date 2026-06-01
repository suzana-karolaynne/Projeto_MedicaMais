# Relatório de Execução — Interface de Exames

Interface testada

Tela de Registro de Exames.

URL local:

http://localhost:3000/exames.html

Ambiente de testes
Item	Valor
Ferramenta	Robot Framework
Biblioteca	SeleniumLibrary
Navegador	Google Chrome
Ambiente	Localhost
Data de execução	31/05/2026
Comando utilizado
py -m robot -d docs/yago-testes-interface/resultados/exames robot/yago_exames_interface.robot
Resultados
Caso de Teste	Resultado Esperado	Resultado Obtido	Status
CT01 — Campos obrigatórios	Todos os campos são obrigatórios	Todos os campos são obrigatórios	Aprovado
CT02 — Exame válido	Exame registrado com sucesso	Exame registrado com sucesso	Aprovado
Evidências
Arquivo	Descrição
docs/yago-testes-interface/resultados/exames/report.html	Relatório da execução
docs/yago-testes-interface/resultados/exames/log.html	Log detalhado
docs/yago-testes-interface/resultados/exames/output.xml	Resultado bruto
docs/yago-testes-interface/evidencias/ct01-exame-campos-obrigatorios.png	Evidência do CT01
docs/yago-testes-interface/evidencias/ct02-exame-valido.png	Evidência do CT02
Resumo
Total de testes	Aprovados	Reprovados
2	2	0
Conclusão

Os testes automatizados da tela de exames foram executados com sucesso usando Robot Framework e SeleniumLibrary.
