// Imports
const express = require('express');

// Initializations
const router = express.Router();

// Connection to Database
const pool = require('../database');

router.get('/commissionorder', async (req, res) => {
  // Consulta a BD para cargar los nombres de los empleados en la lista de la vista
  const queryEmployees = await pool.query('SELECT * FROM Empleado');

  res.render('viatical/commissionorder', {
    style: 'commissionorder.css',
    queryEmployees});
});

router.post('/commissionorder', (req, res) => {
  // Aqui se registran los datos del formulario: commissionorder
  const { commissionDay, commissionDate, commissionHour, commissionObjective, employeeName } = req.body;
  const newCommissionOrder = {
    commissionDay,
    commissionDate,
    commissionHour,
    commissionObjective,
    employeeName
  };

  res.redirect('choosepath');
});

router.get('/choosepath', async (req, res) => {
  // Consulta a BD para cargar los nombres de las oficinas regionales
  const queryOrigin = await pool.query('SELECT DISTINCT origenOficina FROM TarifasAutomovilTrayecto ORDER BY origenOficina');
  // Consulta a BD para cargar los nombres de los municipios de destino
  const queryDestiny = await pool.query('SELECT destinoMunicipio FROM TarifasAutomovilTrayecto ORDER BY destinoMunicipio');

  res.render('viatical/choosepath', {queryOrigin, queryDestiny});
});

router.post('/choosepath', (req, res) => {
  // Aqui se registran los datos de la ruta seleccionada
  const { choosePathOrigin, choosePathDestiny } = req.body;
  const newChoosePath = {
    choosePathOrigin,
    choosePathDestiny,
  };
  console.log(req.body);

  res.redirect('selectedpath');
});

router.get('/selectedpath', (req, res) => {
  res.render('viatical/selectedpath', {style: 'selectedpath.css'});
});

router.get('/others', (req, res) => {
  res.render('viatical/others');
});

// Exports modules
module.exports = router;