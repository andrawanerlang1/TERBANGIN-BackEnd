const router = require('express').Router()
const {
  login,
  register,
  getuserbyId,
  patchimg,
  resetPassword,
  deleteImg,
  settings
} = require('../controller/user')
// const {authUser ,authrole1} = require('../middleware/auth')
const uploadImage = require('../middleware/multerUser')
// ==> Auth  <== //
router.post('/login', login)
router.post('/register', register)
router.patch('/reset', resetPassword)
// ==> User <==
router.get('/:id', getuserbyId)
router.patch('/settings/:id', settings)
router.patch('/img/:id', uploadImage, patchimg)
router.delete('deleteImg/:id', deleteImg)
module.exports = router
