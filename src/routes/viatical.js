// Imports
const express = require('express');
const tollBooth = require('./../lib/tollBooth');
const cleanerQueryToll = require('./../lib/cleanerQueryToll');

// Initializations
const router = express.Router();
// Este objeto contendrá la data de los formularios
var data = {};
// Connection to Database
const pool = require('../database');
const { query } = require('express');

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

  data = {
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
  const queryDestiny = await pool.query('SELECT DISTINCT destinoMunicipio FROM TarifasAutomovilTrayecto ORDER BY destinoMunicipio');

  res.render('viatical/choosepath', {queryOrigin, queryDestiny});
});

router.post('/choosepath', (req, res) => {
  // Aqui se registran los datos de la ruta seleccionada
  const { choosePathOrigin, choosePathDestiny } = req.body;
  data['choosePathOrigin'] = choosePathOrigin;
  data['choosePathDestiny'] = choosePathDestiny;

  res.redirect('selectedpath');
});

router.get('/selectedpath', async (req, res) => {
  // Consulta a BD para cargar la distancia y el tiempo de la ruta seleccionada
  const queryDistanceTime = `SELECT distancia, tiempo FROM TarifasAutomovilTrayecto WHERE origenOficina = '${data.choosePathOrigin}' and destinoMunicipio = '${data.choosePathDestiny}'`;

  // Consulta a BD parara cargar las casetas de peaje
  const tollNames = `SELECT ${tollBooth.tollBooth()} FROM TarifasAutomovilTrayecto WHERE origenOficina = '${
    data.choosePathOrigin
  }' and destinoMunicipio = '${data.choosePathDestiny}'`;

  // Ejecución de las consultas
  const querySelectedPath = await pool.query(queryDistanceTime);
  const queryTollBooth = await pool.query(tollNames);
  //console.log(queryTollBooth);

  // Tratamiento de los valores retornados de la cconsulta
  // Limpia valores nullos de queryTollBooth
  const tollRoad = cleanerQueryToll.clean(queryTollBooth);
  console.log(tollRoad);
  data["selectedPathDistance"] = querySelectedPath[0].distancia;
  data["selectedPathTime"] = querySelectedPath[0].tiempo;
  res.render("viatical/selectedpath", { style: "selectedpath.css", data });
});

router.get('/others', (req, res) => {
  res.render('viatical/others');
});

router.get('/foods', (req, res) => {
  res.render('viatical/foods');
});

router.get('/lodging', (req, res) => {
  res.render('viatical/lodging');
});

// Exports modules
module.exports = router;