// Imports
const express = require('express');

// Initializations
const router = express.Router();

// Connection to Database
const pool = require('../database');

router.get('/commissionorder', async (req, res) => {
  // Consulta a BD para cargar los nombre de los empleados en la lista de la vista
  const queryEmployees = await pool.query('SELECT * FROM Empleado');
  //console.log(queryEmployees);

  res.render('viatical/commissionorder', {queryEmployees});
});

router.post('/commissionorder', (req, res) => {
  const { commissionDay, commissionDate, commissionHour, commissionObjective, employeeName } = req.body;
  const newCommissionOrder = {
    commissionDay,
    commissionDate,
    commissionHour,
    commissionObjective,
    employeeName
  };

  console.log('INSERT INTO Comision SET' + [newCommissionOrder]);
  res.redirect('choosepath');
});

router.get('/choosepath', (req, res) => {
  res.render('viatical/choosepath', {
    offices: [
      "Orizaba",
      "Veracruz",
      "Xalapa",
      "Poza Rica",
      "Coatzacoalcos"
    ]
  });
});

router.post('/choosepath', (req, res) => {
  res.redirect('selectedpath');
});

router.get('/selectedpath', (req, res) => {
  res.render('viatical/selectedpath');
});

// Exports modules
module.exports = router;
