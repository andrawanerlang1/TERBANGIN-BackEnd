const router = require('express').Router()
const user = require('./routes/user')
const flight = require('./routes/flight')

router.use('/user', user)
router.use('/flight', flight)

module.exports = router
