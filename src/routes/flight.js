const router = require('express').Router()
const uploadImage = require('../middleware/multerMascapaiImage')
const {
  postFlight,
  updateCapacity,
  getFlight,
  getAllFlight,
  getFlightById
} = require('../controller/flight')
const { authUser, authrole1 } = require('../middleware/auth')

router.post('/', authUser, authrole1, uploadImage, postFlight)
router.patch('/', authUser, updateCapacity)
router.get('/', authUser, getFlight)
router.get('/all', authUser, getAllFlight)
router.get('/:id', authUser, getFlightById)

module.exports = router
