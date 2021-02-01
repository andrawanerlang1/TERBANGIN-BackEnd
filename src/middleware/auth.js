const jwt = require('jsonwebtoken')
const helper = require('../helper/response')

module.exports = {
  authUser: (request, response, next) => {
    let token = request.headers.authUser
    console.log(token)
    token = token.split(' ')[1]
    jwt.verify(token, 'TERBANGIN', (error, result) => {
      if (
        (error && error.name === 'JsonWebTokenError') ||
        (error && error.name === 'TokenExpiredError')
      ) {
        console.log(error)
        return helper.response(response, 400, error.message)
      } else {
        console.log(result)
        request.token = result
        next()
      }
    })
  },
  authrole1: (request, response, next) => {
    let token = request.headers.authrole1
    token = token.split(' ')[1]
    jwt.verify(token, 'TERBANGIN', (error, result) => {
      if (
        (error && error.name === 'JsonWebTokenError') ||
        (error && error.name === 'TokenExpiredError')
      ) {
        console.log(error)
        return helper.response(response, 400, error.message)
      } else {
        console.log(result)

        if (result.role === 1) {
          request.token = result
          next()
        } else {
          return helper.response(
            response,
            202,
            'Not Allowed ! Page accessible by admin only'
          )
        }
      }
    })
  }
}
