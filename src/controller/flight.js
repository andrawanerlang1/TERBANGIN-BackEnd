const helper = require('../helper/response')
const { postFlightModel } = require('../model/flight')

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
  }
}
