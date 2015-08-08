###
  /users 下的路由配置
  对 user 进行的数据操作和访问
###

router = require 'express'
  .Router()

router.post '/', (req, res) ->
  res.send 'respond with a resource'

module.exports = router