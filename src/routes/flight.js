const router = require('express').Router()
const uploadImage = require('../middleware/multerMascapaiImage')
const {
  postFlight,
  updateCapacity,
  getFlight
} = require('../controller/flight')

router.post('/', uploadImage, postFlight)
router.patch('/', updateCapacity)
router.get('/', getFlight)

module.exports = router
