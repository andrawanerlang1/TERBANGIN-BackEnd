const router = require('express').Router()
const uploadImage = require('../middleware/multerMascapaiImage')
const { postFlight } = require('../controller/flight')

router.post('/', uploadImage, postFlight)

module.exports = router
