const express = require('express')
const bodyParser = require('body-parser')
const morgan = require('morgan')
const cors = require('cors')
const routerNavigation = require('./src/routesNavigation')

require('dotenv').config()

const app = express()
app.use(cors())
app.use(morgan('dev'))
app.use(express.static('uploads'))

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

app.use('/', routerNavigation)
app.get('*', (request, response) => {
  response.status(404).send('Path Not Found')
})


app.listen(3000, () => {
  console.log("Express app is listening on port 3000");
});

