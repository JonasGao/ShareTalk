express = require "express"
router = express.Router()

# 首页
router.get "/", (req, res) ->
  res.render "index"

# 登入页面
router.get "/login", (req, res) ->
  res.render "index"

# 登入请求
router.post "/dpLogin", (req, res) ->
  res.render "index"

module.exports = router