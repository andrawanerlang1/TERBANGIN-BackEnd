const { response } = require('express')
const { login, register, getuserbyId, settings } = require('../model/user')
// const helper = require("../helper/response");

module.exports = {
  login: async (request, response) => {
    console.log('test')
  },
  register: async (request, response) => {},
  getuserbyId: async (request, response) => {},
  forgotPassword: async (request, response) => {},
  resetPassword: async (request, response) => {},
  settings: async (request, response) => {}
}
