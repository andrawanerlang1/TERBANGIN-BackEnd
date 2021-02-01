const router = require('express').Router()
const {
  postBooking,
  patchStatusBooking,
  getDataBookingByUserId,
  getBookingDetail,
  getAllDataBooking
} = require('../controller/booking')
const { authUser, authrole1 } = require('../middleware/auth')

router.get('/detail/:id', authUser, getBookingDetail) // http://localhost:3000/detail/:id
router.get('/:id', authUser, getDataBookingByUserId) // http://localhost:3000/booking/:id
router.get('/', authUser, authrole1, getAllDataBooking)
router.post('/book', authUser, postBooking) // http://localhost:3000/booking/book
router.patch('/book/', authUser, patchStatusBooking) // http://localhost:3000/booking/book/?userId=1&id=1

module.exports = router
