const {
  postBooking,
  postDataPassenger,
  getDataBookingByUserId,
  patchStatusBooking,
  getBookingDetail
} = require('../model/booking')
const helper = require('../helper/response')
module.exports = {
  postBooking: async (req, res) => {
    try {
      const data = req.body
      let result

      for (let i = 0; i < data.length; i++) {
        if (i === 0) {
          const {
            userId,
            flightId,
            totalPassenger,
            totalPayment,
            contactFullName,
            contactEmail,
            contactNumber
          } = data[0]

          const setData = {
            userId,
            flightId,
            totalPassenger,
            contactFullName,
            contactEmail,
            contactNumber,
            totalPayment,
            paymentStatus: 0,
            code: require('crypto').randomBytes(8).toString('hex'),
            createdAt: new Date()
          }
          result = await postBooking(setData)
        } else {
          const {
            title,
            fullName,
            nationality
          } = data[i]

          const setDataPassenger = {
            bookingId: result.bookingId,
            title,
            fullName,
            nationality
          }
          await postDataPassenger(setDataPassenger)
        }
      }
      return helper.response(res, 200, 'Success booking! Enjoy your trip', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request!', error)
    }
  },
  getDataBookingByUserId: async (req, res) => {
    try {
      const { id } = req.params
      const result = await getDataBookingByUserId(id)
      if (result.length > 0) {
        return helper.response(res, 200, `Success get data booking by id user ${id}`, result)
      } else {
        return helper.response(res, 404, 'You haven\'t booking any ticket!')
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request!', error)
    }
  }
}
