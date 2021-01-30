const connection = require('../config/mysql')

module.exports = {
  postBooking: (setData) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'INSERT INTO booking SET ?', setData, (err, result) => {
          const newResult = {
            bookingId: result.insertId,
            ...setData
          }
          if (!err) {
            resolve(newResult)
          } else {
            reject(new Error(err))
          }
        }
      )
    })
  },
  postDataPassenger: (setData) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'INSERT INTO passenger SET ?', setData, (err, result) => {
          const newResult = {
            ...setData
          }
          if (!err) {
            resolve(newResult)
          } else {
            reject(new Error(err))
          }
        }
      )
    })
  },
  patchStatusBooking: (setData, id) => {
    return new Promise((resolve, reject) => {
      connection.query(`UPDATE booking SET ? WHERE bookingId=${id}`, setData, (error, result) => {
        if (!error) {
          const newResult = {
            ...setData
          }
          resolve(newResult)
        } else {
          reject(new Error(error))
        }
      })
    })
  },
  getDataByBookingId: (id, userId) => {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM booking WHERE bookingId=${id} AND userId=${userId} AND paymentStatus=0`, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(error)
        }
      })
    })
  },
  getDataBookingDetail: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM booking WHERE bookingId=${id}`, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(error)
        }
      })
    })
  },
  getDataBookingByUserId: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM booking WHERE userId=${id}`, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(error)
        }
      })
    })
  },
  getBookingDetail: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT mascapai, mascapaiImage, fromCountry, toCountry, clas, departureTime, booking.bookingId, booking.code FROM booking JOIN flight ON booking.flightId=flight.flightId WHERE bookingId=${id}`, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(error)
        }
      })
    })
  }
}
