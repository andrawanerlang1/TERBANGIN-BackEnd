const helper = require('../helper/response')
// const fs = require('fs')
const {
  postFlightModel,
  updateCapacityModel,
  getTotalCapacity,
  getFlightModel
} = require('../model/flight')

module.exports = {
  postFlight: async (req, res) => {
    try {
      const {
        mascapai,
        departureTime,
        arrivedTime,
        flightDate,
        price,
        food,
        wifi,
        luggage,
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
        flightDate &&
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
          flightDate,
          departureTime,
          arrivedTime,
          price,
          food,
          wifi,
          luggage,
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
        return helper.response(res, 400, 'Please fill out the form correctly')
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
      const a = parseInt(totalPassenger)
      const setData = {
        capacity: cap[0].capacity - a
      }
      if (totalPassenger > 10) {
        return helper.response(
          res,
          400,
          'Booking cannot be processed, you can only book for a maximum of 10 passengers'
        )
      } else {
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
      }
    } catch (error) {
      console.log(error)
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getFlight: async (req, res) => {
    try {
      const {
        fromCity,
        toCity,
        flightDate,
        clas,
        transitDirect,
        transit1,
        transit2,
        food,
        wifi,
        luggage,
        departureTime,
        arrivedTime,
        mascapai,
        priceMin,
        priceMax,
        sort
      } = req.query

      const transitDir = transitDirect !== 0 ? ' transitType = 0' : ''
      const transit1x = transit1 !== 0 ? ' transitType = 1' : ''
      const transit2x = transit2 !== 0 ? ' transitType = 2' : ''
      const transit =
        transitDir === '' && transit1x === '' && transit2x === ''
          ? ''
          : transitDir === '' && transit1x === ''
          ? ` AND (${transit2x})`
          : transitDir === ''
          ? ` AND (${transit1x} OR${transit2x})`
          : ` AND (${transitDir} OR${transit1x} OR${transit2x})`

      const facLuggage = luggage !== '' ? ` AND luggage = ${luggage}` : ''
      const facfood = food !== '' ? ` AND food = ${food}` : ''
      const facwifi = wifi !== '' ? ` AND wifi = ${wifi}` : ''
      const departure =
        departureTime !== '' ? ` AND departureTime = ${departureTime}` : ''
      const arrived =
        arrivedTime !== '' ? ` AND arrivedTime = ${arrivedTime}` : ''
      const airline = mascapai !== '' ? ` AND mascapai = ${mascapai}` : ''

      const result = await getFlightModel(
        fromCity,
        toCity,
        flightDate,
        clas,
        transit,
        facLuggage,
        facfood,
        facwifi,
        departure,
        arrived,
        airline,
        priceMin,
        priceMax,
        sort
      )
      return helper.response(res, 200, 'Success get flight !', result)
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
