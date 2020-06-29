// Imports
const express = require('express');

// Initializations
const router = express.Router();

// Routes
router.get('/', (req, res) =>
{
  res.send('Hello');
});

// Exports modules
module.exports = router;