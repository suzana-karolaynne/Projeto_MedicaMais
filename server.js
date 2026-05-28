const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

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

app.listen(3000, () => {
  console.log("Servidor rodando em http://localhost:3000");
});