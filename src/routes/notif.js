const router = require('express').Router()
const {
  postNotif,
  getNotifByUserId,
  deleteNotifByUserId
} = require('../controller/notif')

router.get('/:id', getNotifByUserId)
router.post('/post', postNotif)
router.delete('/:id', deleteNotifByUserId)

module.exports = router
