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

app.post("/agendamentos", (req, res) => {
  const { especialidade, medico, data, hora } = req.body;

  if (!especialidade || !medico || !data || !hora) {
    return res.status(400).json({
      mensagem: "Todos os campos são obrigatórios"
    });
  }

  const dataConsulta = new Date(`${data}T${hora}`);

  if (isNaN(dataConsulta.getTime())) {
    return res.status(400).json({
      mensagem: "Data ou hora inválida"
    });
  }

  const agora = new Date();

  if (dataConsulta <= agora) {
    return res.status(400).json({
      mensagem: "A consulta deve ser agendada para uma data futura"
    });
  }

  return res.status(201).json({
    mensagem: "Agendamento realizado com sucesso",
    agendamento: {
      especialidade,
      medico,
      data,
      hora
    }
  });
});

app.post("/sinais-vitais", (req, res) => {
  const {
    pressaoArterial,
    temperatura,
    frequenciaCardiaca,
    saturacaoOxigenio
  } = req.body;

  if (
    !pressaoArterial ||
    temperatura === undefined ||
    frequenciaCardiaca === undefined ||
    saturacaoOxigenio === undefined
  ) {
    return res.status(400).json({
      mensagem: "Todos os campos são obrigatórios"
    });
  }

  if (Number(temperatura) < 35 || Number(temperatura) > 42) {
    return res.status(400).json({
      mensagem: "Temperatura fora da faixa permitida"
    });
  }

  if (Number(frequenciaCardiaca) < 40 || Number(frequenciaCardiaca) > 180) {
    return res.status(400).json({
      mensagem: "Frequência cardíaca fora da faixa permitida"
    });
  }

  if (Number(saturacaoOxigenio) < 70 || Number(saturacaoOxigenio) > 100) {
    return res.status(400).json({
      mensagem: "Saturação de oxigênio fora da faixa permitida"
    });
  }

  return res.status(201).json({
    mensagem: "Sinais vitais registrados com sucesso",
    sinaisVitais: {
      pressaoArterial,
      temperatura: Number(temperatura),
      frequenciaCardiaca: Number(frequenciaCardiaca),
      saturacaoOxigenio: Number(saturacaoOxigenio)
    }
  });
});

app.get("/", (req, res) => {
  res.send(`
    <h1>MedicaMais</h1>
    <p>API em funcionamento.</p>
  `);
});

app.listen(3000, () => {
  console.log("Servidor rodando em http://localhost:3000");
});