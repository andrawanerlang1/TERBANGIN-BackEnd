const router = require('express').Router()
const {
  login,
  register,
  getuserbyId,
//   patchimg,
  forgotPassword,
  resetPassword,
  settings
} = require('../controller/user')
// const {authUser ,authrole1} = require('../middleware/auth')
const uploadImage = require('../middleware/multerUser')
// ==> Auth  <== //
router.post('/login', login)
router.post('/register', register)
router.post('/forgot', forgotPassword)
router.patch('/reset', resetPassword)
// ==> User <==
router.get('/:id', getuserbyId)
router.patch('/settings/:id', settings)
// router.patch('/img/:id', uploadImage, patchimg)

module.exports = router
