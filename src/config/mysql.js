const mysql = require('mysql')
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'iyus123',
  database: 'terbangin',
  timezone: 'UTC'
})

connection.connect((error) => {
  if (error) {
    throw error
  } else {
    console.log('You are now connected to database.')
  }
})

module.exports = connection
