const router = require('express').Router()
const {
  login,
  register,
  getuserbyId,
  forgotPassword,
  resetPassword,
  settings
} = require('../controller/user')

// ==> Auth  <== //
router.post('/login', login)
router.post('/register', register)
router.post('/forgot', forgotPassword)
router.post('/reset', resetPassword)
// ==> User <==
router.get('/:id', getuserbyId)
router.patch('/settings/:id', settings)

module.exports = router
