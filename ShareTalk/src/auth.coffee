###
  ȫ����Ȩ������
###

User = require './modules/User.coffee'

authFilter = (req, res, next) ->

  console.log req

  User.auth("a", "b")

  # ͨ��
  # next()

module.exports = authFilter;