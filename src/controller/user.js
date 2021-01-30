const {
  login,
  register,
  dataUser,
  getuserbyId,
  getIdmodel,
  settings
} = require('../model/user')
const helper = require('../helper/response')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const nodemailer = require('nodemailer')
const fs = require('fs')
const response = require('../helper/response')

module.exports = {
  login: async (request, response) => {
    try {
      const { email, password } = request.body
      console.log(request.body)

      if (request.body.email === '') {
        return helper.response(response, 400, 'Insert email Please :)')
      } else if (request.body.password === '') {
        return helper.response(response, 400, 'Insert Password Please :)')
      } else {
        const checkDataUser = await login(email)
        console.log(checkDataUser)
        if (checkDataUser.length > 0) {
          const checkPassword = bcrypt.compareSync(
            password,
            checkDataUser[0].password
          )
          console.log(checkPassword)
          if (checkPassword) {
            const { userId, fullName, email, role } = checkDataUser[0]
            const paylot = {
              userId,
              fullName,
              email,
              role
            }
            const token = jwt.sign(paylot, 'TERBANGIN', { expiresIn: '10h' })
            const result = { ...paylot, token }
            return helper.response(response, 200, 'Succes Login ', result)
          } else {
            return helper.response(response, 404, 'wrong password !')
          }
        } else {
          return helper.response(response, 404, 'account not register !')
        }
      }
    } catch (error) {
      return helper.response(response, 404, 'bad request', error)
    }
  },
  register: async (request, response) => {
    try {
      console.log(request.body)

      const { fullName, email, password } = request.body
      const salt = bcrypt.genSaltSync(10)
      const encryptPassword = bcrypt.hashSync(password, salt)
      const setData = {
        fullName,
        email,
        role: 0,
        password: encryptPassword
      }
      const checkDataUser = await login(email)
      console.log(request.body.email)
      if (checkDataUser.length >= 1) {
        return helper.response(response, 400, 'Email has been register :((')
      } else if (request.body.email === '') {
        return helper.response(response, 400, 'Insert EMAIL Please :))')
      } else if (request.body.email.search('@') < 1) {
        return helper.response(
          response,
          400,
          'Email not valid  !!, must be @ s'
        )
      } else if (request.body.password < 8 || request.body.password > 16) {
        return helper.response(
          response,
          400,
          'Password must be 8 - 16 characters '
        )
      } else if (request.body.password === '') {
        return helper.response(response, 400, 'Insert Password Please')
      } else {
        const result = await register(setData)
        return helper.response(response, 200, 'ok', result)
      }
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  getuserbyId: async (request, response) => {
    try {
      const { id } = request.params

      let result
      if (id) {
        result = await getuserbyId(id)
        if (result.length === 0) {
          return helper.response(response, 404, `user By Id : ${id} Not Found`)
        }
      } else {
        result = await dataUser(id)
        if (result.length === 0) {
          return helper.response(response, 404, 'no data')
        }
      }

      return helper.response(response, 200, 'Success get data', result)
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  resetPassword: async (request, response) => {
    try {
      console.log(request.body)
      const { id, newPassword, confirmPassword } = request.body
      if (newPassword.length < 8 || newPassword.length > 16) {
        return helper.response(
          response,
          400,
          'Password must be 8-16 characters long'
        )
      } else if (newPassword !== confirmPassword) {
        return helper.response(
          response,
          400,
          `Password didn't match ${newPassword}`
        )
      } else {
        const getId = await getuserbyId(id)
        console.log(getId)
        if (getId.length < 1) {
          return helper.response(response, 400, 'Bad Request')
        } else {
          const userId = getId[0].userId
          const update = new Date() - getId[0].updatedAt
          const changeKeys = Math.floor(update / 1000 / 60)
          if (changeKeys >= 5) {
            const setData = {
              userKey: 0,
              updatedAt: new Date()
            }
            await settings(setData, userId)
            return helper.response(
              response,
              400,
              'Please confirm password again, keys is expires :))'
            )
          } else {
            // new Password
            const salt = bcrypt.genSaltSync(7)
            const encryptPassword = bcrypt.hashSync(newPassword, salt)
            const setData = {
              password: encryptPassword,
              userKey: 0,
              updatedAt: new Date()
            }
            await settings(setData, userId)
            return helper.response(response, 200, 'Password Succes change yey')
          }
        }
      }
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  patchimg: async (request, response) => {
    try {
      const { id } = request.params
      console.log(id)
      console.log(request.body)
      const setData = {
        profileImage: request.file.filename
      }
      const cekId = await getuserbyId(id)
      if (cekId.length > 0) {
        if (cekId[0].profileImage === '' || request.file === undefined) {
          const result = await settings(setData, id)
          return helper.response(response, 201, 'Profile Updated', result)
        } else {
          fs.unlink(`./uploads/user${cekId[0].profileImage}`, async (error) => {
            if (error) {
              throw error
            } else {
              const result = await settings(setData, id)
              return helper.response(response, 201, 'Profile Updated', result)
            }
          })
        }
      }
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  deleteImg: async (request, response) => {
    try {
      const { id } = request.params
      console.log(id)
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  settings: async (request, response) => {
    try {
      const { id } = request.params
      const {
        fullName,
        email,
        phoneNumber,
        city,
        nationality,
        postCode
      } = request.body
      const setData = {
        fullName,
        email,
        phoneNumber,
        city,
        nationality,
        postCode,
        updatedAt: new Date()
      }
      const checkkUser = await getuserbyId(id)
      if (checkkUser.length > 0) {
        const result = await settings(setData, id)
        console.log(result)
        return helper.response(response, 200, 'Data updated', result)
      } else {
        return helper.response(response, 404, `Data Not Found By Id ${id}`)
      }
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  }
}
