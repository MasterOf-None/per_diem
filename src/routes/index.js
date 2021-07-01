// Imports
const express = require('express');

// Initializations
const router = express.Router();

// Routes
router.get('/', (req, res) => {
  res.render('viatical/index');
});

router.post('/', (req, res) => {
  res.redirect('viatical/commissionorder');
});

// Exports modules
module.exports = router;