router = require 'express'
  .Router()

router.get '/', (req, res) ->
  res.send 'respond with a resource'

module.exports = router