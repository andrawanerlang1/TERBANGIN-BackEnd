const router = require('express').Router()
const {
  postMidtransNotif,
  postBooking,
  patchStatusBooking,
  getDataBookingByUserId,
  getBookingDetail,
  getAllDataBooking
} = require('../controller/booking')
const { authUser, authrole1 } = require('../middleware/auth')

router.get('/detail/:id', authUser, getBookingDetail)
router.get('/:id', authUser, getDataBookingByUserId)
router.get('/', authUser, authrole1, getAllDataBooking)
router.post('/book', authUser, postBooking)
router.post('/midtrans-notif', authUser, postMidtransNotif)
router.patch('/book/', authUser, patchStatusBooking)

module.exports = router
