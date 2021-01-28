const router = require('express').Router()
const user = require('./routes/user')
const booking = require('./routes/booking')
const flight = require('./routes/flight')

router.use('/user', user)
router.use('/flight', flight)
router.use('/booking', booking)

module.exports = router
