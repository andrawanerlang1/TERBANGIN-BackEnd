const router = require('express').Router()
const uploadImage = require('../middleware/multerMascapaiImage')
const { postFlight, updateCapacity } = require('../controller/flight')

router.post('/', uploadImage, postFlight)
router.patch('/', updateCapacity)

module.exports = router
