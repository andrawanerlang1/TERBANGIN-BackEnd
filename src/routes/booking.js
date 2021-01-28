const router = require('express').Router()
const {
  postBooking,
  getDataBookingByUserId
} = require('../controller/booking')

router.post('/book', postBooking) // http://localhost:3000/booking/book/
router.get('/:id', getDataBookingByUserId) // http://localhost:3000/booking/:id

module.exports = router
