###
  登录控制器
###
express = require 'express'
User = require '../models/User'
md5Util = require '../utils/md5'

router = express.Router()

# 检查用户上传的参数
valid = (user) ->
  return false for key in ['mail', 'password'] when not (key of user)
  return true

router.post '/', (req, res) ->

  user = req.body

  if not valid user
    res.json '无效的参数'
    return

  user.password = md5Util.toMd5 user.password

  User.find user, (err, docs) ->
    result = null
    if err
      result = err
    else if docs.length
      result = req.session.user = docs[0]
    res.json result or '账户名或密码错误'

module.exports = router