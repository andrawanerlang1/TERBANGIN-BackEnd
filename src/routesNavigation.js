const router = require('express').Router()

const user = require('./routes/user')
const booking = require('./routes/booking')
router.use('/user', user)
router.use('/booking', booking)

module.exports = router
