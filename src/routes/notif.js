const router = require('express').Router()
const {
  postNotif,
  getAllNotif,
  getNotifByUserId,
  deleteNotifByUserId
} = require('../controller/booking')

router.get('/all', getAllNotif)
router.get('/get/:id', getNotifByUserId)
router.post('/post', postNotif)
router.delete('/:id', deleteNotifByUserId)

module.exports = router
