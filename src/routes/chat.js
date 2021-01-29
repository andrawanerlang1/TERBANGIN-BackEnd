const router = require('express').Router()

const {
  createRoom,
  getRoom,
  sendMessage,
  getMessage
} = require('../controller/chat')

router.get('/room/:id', getRoom)
router.post('/room', createRoom)
router.post('/message', sendMessage)
router.get('/message/:id', getMessage)

module.exports = router
