const helper = require('../helper/response')
const {
  postFlightModel,
  updateCapacityModel,
  getTotalCapacity
} = require('../model/flight')

module.exports = {
  postFlight: async (req, res) => {
    try {
      const {
        mascapai,
        facilities,
        departureTime,
        arrivedTime,
        price,
        capacity,
        clas,
        fromCity,
        fromCountry,
        toCity,
        toCountry,
        tripType,
        terminal,
        transitType
      } = req.body
      if (
        mascapai &&
        facilities &&
        departureTime &&
        arrivedTime &&
        price &&
        capacity &&
        clas &&
        fromCity &&
        toCity &&
        fromCountry &&
        toCountry &&
        tripType &&
        terminal &&
        transitType
      ) {
        const setData = {
          mascapai,
          mascapaiImage: req.file === undefined ? '' : req.file.filename,
          facilities,
          departureTime,
          arrivedTime,
          price,
          capacity,
          clas,
          fromCity,
          fromCountry,
          toCity,
          toCountry,
          tripType,
          terminal,
          transitType
        }
        const result = await postFlightModel(setData)
        return helper.response(res, 200, 'Success add new flight', result)
      } else {
        return helper.response(res, 400, 'All data must be filled in')
      }
    } catch (error) {
      console.log(error)
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  updateCapacity: async (req, res) => {
    try {
      const { totalPassenger, flightId } = req.body
      const cap = await getTotalCapacity(flightId)
      const b = cap
      const a = parseInt(totalPassenger)
      //   console.log(b[0].capacity)
      //   console.log(a)
      //   console.log(b[0].capacity - a)
      const setData = {
        capacity: cap[0].capacity - a
      }
      //   console.log(setData.capacity)
      if (setData.capacity < 0) {
        return helper.response(
          res,
          400,
          'Sorry! This airlines id full of capacity'
        )
      } else {
        const result = await updateCapacityModel(setData, flightId)
        console.log(result)
        return helper.response(
          res,
          200,
          'Success book your flight, thank you !'
        )
      }
    } catch (error) {
      console.log(error)
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
