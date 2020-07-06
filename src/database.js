const mysql = require('mysql');
const keys { database } = require('./keys');

const pool = mysql.createPool(database);
//pool.getConnection(err, connection)