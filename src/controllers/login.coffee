###
  登录控制器
###

router = require('express').Router()
User = require '../models/User'

# 检查用户上传的参数
valid = (user) ->
  return false for key in ['mail', 'password'] when not (key of user)
  return true

router.post '/login', (req, res) ->
  console.log '进入登录验证'
  user = req.body
  if not valid user
    console.log '非法字段'
    res.json null
    return
  User.find user, (err, docs) ->
    result = null
    if err
      result = err
    else if docs.length
      result = req.session.user = docs[0]
    console.log '登录验证：' + JSON.stringify result
    res.json result

module.exports = router