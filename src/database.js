// Imports
const mysql = require('mysql'); // Módulo de MySQL
const {promisify} = require('util'); // Obtiene solo el objeto promisify del módulo 'util'
const {database} = require('./keys'); // Obtiene solo el objeto database del módulo 'keys'

const pool = mysql.createPool(database); // Crea un pool de conexiones a la base de datos
pool.getConnection((err, connection)=> // Maneja los errores
{
  if(err)
  {
    if(err.code === "PROTOCOL_CONNECTION_LOST")
    {
      console.err("DATABASE  CONNECTION WAS CLOSED");
    }
    if(err.code === "ERR_CON_COUNT_ERROR")
    {
      console.error("DATABASE HAS TO MANY CONNECTIONS");
    }
    if(err.code === "ECONNREFUSED")
    {
      console.log("DATABASE CONNECTION WAS REFUSED");
    }
  }
  // Good Connection
  if(connection)
  {
    connection.release();
    console.log("DB is Conected Sussesfully");
  }
});

// Promisify Pool Querys
pool.query = promisify(pool.query); // Con este módulo permite que aquellas funciones que solo admiten callbacks se puedan manejar con promesas

module.exports = pool;