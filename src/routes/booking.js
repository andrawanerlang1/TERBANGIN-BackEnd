const router = require('express').Router()
const {
  postBooking,
  patchStatusBooking,
  getDataBookingByUserId,
  getBookingDetail,
  getAllDataBooking
} = require('../controller/booking')

router.get('/detail/:id', getBookingDetail) // http://localhost:3000/detail/:id
router.get('/:id', getDataBookingByUserId) // http://localhost:3000/booking/:id
router.get('/', getAllDataBooking)
router.post('/book', postBooking) // http://localhost:3000/booking/book
router.patch('/book/', patchStatusBooking) // http://localhost:3000/booking/book/?userId=1&id=1

module.exports = router
