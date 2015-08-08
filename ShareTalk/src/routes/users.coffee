###
  /users 下的路由配置
  对 user 进行的数据操作和访问
###

router = require 'express'
  .Router()

router.get '/login', (req, res) ->
  res.render 'login'

router.post '/doLogin', (req, res) ->
  res.json username:'temp user'

module.exports = router