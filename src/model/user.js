const connection = require('../config/mysql')
// Register
// Login
// userBy id
// Settings

module.exports = {
  dataUser: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM user WHERE userId =? AND role = 0 ',
        id,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  login: (account) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT userId, email, password, role FROM user WHERE email=?',
        account,
        (error, result) => {
          console.log(error)
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  register: (setData) => {
    return new Promise((resolve, reject) => {
      connection.query('INSERT INTO user SET ?', setData, (error, result) => {
        if (!error) {
          const newResult = {
            userId: result.insertId,
            ...setData
          }
          delete newResult.password
          resolve(newResult)
        } else {
          reject(new Error(error))
        }
      })
    })
  },
  getuserbyId: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM user WHERE userId =? ',
        id,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  //   forgotPassword
  // reset Password
  settings: (setData, id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        'UPDATE user SET ? WHERE userId  = ?',
        [setData, id],
        (error, result) => {
          if (!error) {
            const newResult = {
              userId: id,
              ...setData
            }
            resolve(newResult)
          } else {
            reject(new Error(error))
          }
        }
      )
    })
  }
}
