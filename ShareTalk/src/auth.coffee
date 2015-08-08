###
  全局授权拦截器
###

User = require './modules/User.coffee'

authFilter = (req, res, next) ->

  console.log req

  User.auth("a", "b")

  # 通过
  # next()

module.exports = authFilter;