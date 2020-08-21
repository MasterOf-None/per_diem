// Imports
const express = require('express');

// Initializations
const router = express.Router();

// Routes
router.get('/', (req, res) =>
{
  res.render('viatical/index');
});

// Exports modules
module.exports = router;