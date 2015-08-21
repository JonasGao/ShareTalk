express = require "express"
router = express.Router()

# 首页
router.get "/", (req, res) ->
  res.render "index"

module.exports = router