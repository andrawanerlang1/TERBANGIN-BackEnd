const connection = require('../config/mysql')
// const fs = require('fs')

module.exports = {
  postFlightModel: (setData) => {
    return new Promise((resolve, reject) => {
      connection.query('INSERT INTO flight SET ?', setData, (error, result) => {
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
  },
  getTotalCapacity: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT capacity, mascapaiImage FROM flight WHERE flightId = ${id}`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  updateCapacityModel: (setData, flightId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'UPDATE flight SET ? WHERE flightId = ?',
        [setData, flightId],
        (error, result) => {
          if (!error) {
            const newResult = {
              flightId: flightId,
              ...setData
            }
            resolve(newResult)
          } else {
            reject(new Error(error))
          }
        }
      )
    })
  },
  getFlightModel: (
    fromCity,
    toCity,
    flightDate,
    clas,
    transit,
    facLuggage,
    facfood,
    facwifi,
    departure,
    arrived,
    airline,
    prices,
    sort
  ) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM flight WHERE fromCity = ${fromCity} AND toCity = ${toCity} AND flightDate = ${flightDate} AND clas = ${clas}${transit}${facLuggage}${facfood}${facwifi}${departure}${arrived}${airline}${prices} ORDER BY ${sort}`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  }
}
