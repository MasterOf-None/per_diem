// Imports
const express = require('express');

// Initializations
const router = express.Router();

// Connection to Database
const pool = require('../database');

router.get('/choosepath', (req, res) =>
{
  res.render('viatical/choosepath');
});

// Exports modules
module.exports = router;