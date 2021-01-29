const router = require('express').Router()
const uploadImage = require('../middleware/multerMascapaiImage')
const {
  postFlight,
  updateCapacity,
  getFlight,
  getAllFlight
} = require('../controller/flight')

router.post('/', uploadImage, postFlight)
router.patch('/', updateCapacity)
router.get('/', getFlight)
router.get('/all', getAllFlight)

module.exports = router
