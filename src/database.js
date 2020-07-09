// Imports
const mysql = require('mysql'); // MySQL module
const {promisify} = require('util'); // Getting only the object promisify of the module 'util'
const {database} = require('./keys'); // Getting only the object database of the module 'keys'

const pool = mysql.createPool(database); // Create a connections pool of the MySQL module
pool.getConnection((err, connection)=> // Handling the errors.
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
pool.query = promisify(pool.query); // With this module will accept promisses

module.exports = pool;