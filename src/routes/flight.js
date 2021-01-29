const router = require('express').Router()
const uploadImage = require('../middleware/multerMascapaiImage')
const {
  postFlight,
  updateCapacity,
  getFlight,
  getAllFlight,
  getFlightById
} = require('../controller/flight')

router.post('/', uploadImage, postFlight)
router.patch('/', updateCapacity)
router.get('/', getFlight)
router.get('/all', getAllFlight)
router.get('/:id', getFlightById)

module.exports = router
