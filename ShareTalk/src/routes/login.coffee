###
  登录控制器
###

router = require 'express'
.Router()

router.get '/login', (req, res) ->
  res.render 'login'

router.post '/doLogin', (req, res) ->
  res.json username:'temp user'

module.exports = router