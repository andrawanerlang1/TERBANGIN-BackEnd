const helper = require("../helper/response");

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
        transitType,
      } = req.body
      if (mascapai && facilities && departureTime && arrivedTime && price && capacity && clas && fromCity && toCity && fromCountry && toCountry && tripType && terminal &&transitType)
    } catch (error) {}
  },
};
