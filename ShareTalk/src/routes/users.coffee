###
  /users 下的路由配置
  对 user 进行的数据操作和访问
###

User = require '../modules/User'
Q = require 'Q'

router = require 'express'
  .Router()

mailReg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/


checkUser = (user) ->
  deferred = Q.defer()
  msg = ""

  # 检查 mail 为空，检查 mail 的格式
  if !user.mail then msg += "mail 为空"
  else if !mailReg.test user.mail then msg += "mail 格式不正确"

  # 检查密码和密码长度
  if !user.password then msg += "密码 为空"
  else if user.password.length < 6 then msg += "密码 最少六位"

  # 检查用户名
  if !user.username then msg += "用户名 为空"

  if user.mail then User.findByMail user.mail, (err, doc)->
    if err then msg += err
    else if doc.length then msg += "账户已存在"
    deferred.resolve msg
  else
    deferred.resolve msg

  deferred.promise


# get list
router.get '/', (req, res) ->
  User.find (err, doc) ->
    res.json doc || []


# get one
router.get '/:id', (req, res) ->
  id = req.params.id

  User.find id:id, (err, doc) ->
    res.json err || doc


# insert
router.post '/', (req, res) ->
  if !req.body then res.json null
  doc = req.body
  checkUser doc
  .then (msg) ->
    if msg
      res.json msg:msg
      return
    newUser = new User(doc)
    newUser.save (err, doc) ->
      res.json doc


# delete
router.delete '/', (req, res) ->
  User.remove (err) ->
    res.json err


# update
router.put '/', (req, res) ->
  User.findById '??', (err, doc) ->
    if doc
      doc.save (err, doc) -> res.json doc
    else
      res.json err || 'Not found user'

module.exports = router