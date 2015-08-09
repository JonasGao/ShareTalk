###
  /users 下的路由配置
  对 user 进行的数据操作和访问
###

User = require '../modules/User'

router = require 'express'
  .Router()

router.get '/', (req, res) ->
  res.json User.find()

module.exports = router