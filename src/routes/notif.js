const router = require('express').Router()
const {
  postNotif,
  getAllNotif,
  getNotifById,
  getBookingDetail
} = require('../controller/booking')

router.get('/all', getAllNotif)
router.get('/get/:id', getNotifById)
router.post('/post', postNotif)

module.exports = router
