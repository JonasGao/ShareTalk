###
  /users �µ�·������
  �� user ���е����ݲ����ͷ���
###

router = require 'express'
  .Router()

router.post '/', (req, res) ->
  res.send 'respond with a resource'

module.exports = router