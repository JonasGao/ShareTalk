###
  第一层路由配置
###

express = require 'express'
router = express.Router()

index = require('./routes/index.coffee');
users = require('./routes/users.coffee');

router.use('/', index);
router.use('/users', users);

router.use (req, res) ->
  res.send '<h1>404</h1>'

module.exports = router;