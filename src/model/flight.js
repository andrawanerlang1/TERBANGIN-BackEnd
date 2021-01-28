const connection = require('../config/mysql')

module.exports = {
  postFlightModel: (setData) => {
    return new Promise((resolve, reject) => {
      connection.query(`INSERT INTO flight SET ?`, setData, (error, result) => {
        if (!error) {
          const newResult = {
            flightId: result.insertId,
            ...setData
          }
          resolve(newResult)
        } else {
          reject(new Error(error))
        }
      })
    })
  }
}
