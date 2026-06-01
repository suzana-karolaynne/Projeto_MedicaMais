const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static(__dirname));

app.post("/login", (req, res) => {
  const { email, senha } = req.body;

  if (!email || !senha) {
    return res.status(400).json({
      mensagem: "Email e senha são obrigatórios"
    });
  }

  if (email !== "suzanakarolaynne@gmail.com" || senha !== "12345678") {
    return res.status(401).json({
      mensagem: "Credenciais inválidas"
    });
  }

  return res.status(200).json({
    mensagem: "Login realizado com sucesso"
  });
});

app.post("/medicamentos", (req, res) => {
  const { nome, dose, unidade, horario } = req.body;

  if (!nome || dose === undefined || !unidade || !horario) {
    return res.status(400).json({
      mensagem: "Todos os campos são obrigatórios"
    });
  }

  if (Number(dose) <= 0) {
    return res.status(400).json({
      mensagem: "Dose inválida"
    });
  }

  return res.status(201).json({
    mensagem: "Medicamento cadastrado com sucesso",
    medicamento: {
      nome,
      dose: Number(dose),
      unidade,
      horario
    }
  });
});

app.post("/vacinas", (req, res) => {
  const { nomeVacina, dataAplicacao, dose } = req.body;

  if (!nomeVacina || !dataAplicacao || !dose) {
    return res.status(400).json({
      mensagem: "Todos os campos são obrigatórios"
    });
  }

  const data = new Date(dataAplicacao);

  if (isNaN(data.getTime())) {
    return res.status(400).json({
      mensagem: "Data de aplicação inválida"
    });
  }

  return res.status(201).json({
    mensagem: "Vacina registrada com sucesso",
    vacina: {
      nomeVacina,
      dataAplicacao,
      dose
    }
  });
});

app.post("/exames", (req, res) => {
  const { nomeExame, dataExame, resultado } = req.body;

  if (!nomeExame || !dataExame || !resultado) {
    return res.status(400).json({
      mensagem: "Todos os campos são obrigatórios"
    });
  }

  const data = new Date(dataExame);

  if (isNaN(data.getTime())) {
    return res.status(400).json({
      mensagem: "Data do exame inválida"
    });
  }

  return res.status(201).json({
    mensagem: "Exame registrado com sucesso",
    exame: {
      nomeExame,
      dataExame,
      resultado
    }
  });
});

app.get("/", (req, res) => {
  res.send(`
    <html>
      <head>
        <title>MedicaMais</title>
      </head>
      <body>
        <h1>MedicaMais</h1>
        <p>API em funcionamento.</p>
      </body>
    </html>
  `);
});

app.listen(3000, () => {
  console.log("Servidor rodando em http://localhost:3000");
});
