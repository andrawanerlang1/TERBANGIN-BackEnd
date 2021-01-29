const router = require('express').Router()
const user = require('./routes/user')
const booking = require('./routes/booking')
const flight = require('./routes/flight')
const Chat = require('./routes/chat')

router.use('/user', user)
router.use('/flight', flight)
router.use('/booking', booking)
router.use('/chat', Chat)

module.exports = router
