const connection = require('../config/mysql')
// post
// patch
// get by user id
// get booking detail
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
  getBookingDetail: () => {
    return new Promise((resolve, reject) => {

    })
  }
}
