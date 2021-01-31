const helper = require('../helper/response')

const {
  postNotifModel,
  getAllNotifModel,
  getNotifByUserIdModel,
  deleteNotifByUserIdModel
} = require('../model/booking')

module.exports = {
  postBooking: async (req, res) => {
    try {
      const { notifTitle, notifMessage, receiverId } = req.body
    } catch (error) {
      return helper.response(res, 400, 'Bad Request!', error)
    }
  }
}
