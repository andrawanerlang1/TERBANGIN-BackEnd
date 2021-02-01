const router = require('express').Router()
const {
  postMidtransNotif,
  postBooking,
  patchStatusBooking,
  getDataBookingByUserId,
  getBookingDetail,
  getAllDataBooking
} = require('../controller/booking')

router.get('/detail/:id', getBookingDetail)
router.get('/:id', getDataBookingByUserId)
router.get('/', getAllDataBooking)
router.post('/book', postBooking)
router.post('/midtrans-notif', postMidtransNotif)
router.patch('/book/', patchStatusBooking)

module.exports = router
