const {
  login,
  register,
  getuserbyId,
  checkDataUser,
  settings
} = require('../model/user')
const helper = require('../helper/response')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const nodemailer = require('nodemailer')

module.exports = {
  login: async (request, response) => {
    try {
      const { user_email, user_password } = request.body
      console.log(request.body)

      if (request.body.user_email === '') {
        return helper.response(response, 400, 'Insert email Please :)')
      } else if (request.body.user_password === '') {
        return helper.response(response, 400, 'Insert Password Please :)')
      } else {
        const checkDataUser = await login(user_email)
        console.log(checkDataUser)
        if (checkDataUser.length > 0) {
          const checkPassword = bcrypt.compareSync(
            user_password,
            checkDataUser[0].user_password
          )
          console.log(checkPassword)
          if (checkPassword) {
            const {
              user_id,
              user_name,
              user_email,
              user_role
            } = checkDataUser[0]
            const paylot = {
              user_id,
              user_name,
              user_email,
              user_role
            }
            const token = jwt.sign(paylot, 'KERJAIN', { expiresIn: '10h' })
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
      const {
        user_name,
        user_email,
        user_numberPhone,
        user_password
      } = request.body
      const salt = bcrypt.genSaltSync(10)
      const encryptPassword = bcrypt.hashSync(user_password, salt)
      const setData = {
        user_name,
        user_email,
        user_numberPhone,
        user_role: 0,
        user_password: encryptPassword
      }
      const checkDataUser = await login(user_email)
      console.log(request.body.user_email)
      if (checkDataUser.length >= 1) {
        return helper.response(response, 400, 'Email has been register :((')
      } else if (request.body.user_email === '') {
        return helper.response(response, 400, 'Insert EMAIL Please :))')
      } else if (request.body.user_email.search('@') < 1) {
        return helper.response(
          response,
          400,
          'Email not valid  !!, must be @ s'
        )
      } else if (
        request.body.user_password < 8 ||
        request.body.user_password > 16
      ) {
        return helper.response(
          response,
          400,
          'Password must be 8 - 16 characters '
        )
      } else if (request.body.user_password === '') {
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
        result = await dataUser()
        if (result.length === 0) {
          return helper.response(response, 404, 'no data')
        }
      }

      return helper.response(response, 200, 'Success get data', result)
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  forgotPassword: async (request, response) => {
      try{
        const { user_email } = request.body
        const checkDataUser = await login(user_email)
        const keys = Math.round(Math.random() * 10000)
        if (checkDataUser.length >= 1) {
          const setData = {
            user_key: keys,
            user_updated_at: new Date()
          }
          await settings(setData, checkDataUser[0].user_id)
          const transporter = nodemailer.createTransport({
            host: 'smtp.gmail.com',
            port: 587,
            secure: false, // true for 465, false for other ports
            auth: {
              user: 'kostkost169@gmail.com', // generated ethereal user
              pass: 'admin@123456' // generated ethereal password
            }
          })
          const mailOptions = {
            from: '"Terbangin " <terbangin@gmail.com', // sender address
            to: user_email, // list of receivers
            subject: 'terbangin.com - Forgot Password', // Subject line
            html: `<p>To Account   ${user_email}</p>
            <p>Hello I am milla personal team from terbangin.com will help you to change your new password, please activate it on this page</p>
            <a href=" http://localhost:8080/confirmpassword/${keys}">Click Here To Change Password</a>`
          }
          await transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
              console.log(error)
              return helper.response(response, 400, 'Email not send !')
            } else {
              console.log(info)
              return helper.response(response, 200, 'Email has been send !')
            }
          })
        } else {
          return helper.response(response, 400, 'Email / Account not Registed !')
        }
      }catch(error){
          return helper.response(response,'Bad Request',error)
      }
  },
  resetPassword: async (request, response) => {
      try{
        console.log(request.body)
      }catch(error){
          return helper.response(response,400, 'Bad Request')
      }
  },
  settings: async (request, response) => {
    try {
      const { id } = request.params
      const {
        user_name,
        user_email,
        user_numberPhone,
        user_city,
        user_nationality,
        post_code
      } = request.body
      const setData = {
        user_name,
        user_email,
        user_numberPhone,
        user_city,
        user_nationality,
        post_code
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
