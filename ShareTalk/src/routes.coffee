###
  第一层路由配置
###

express = require 'express'
router = express.Router()

index = require('./routes/index');
users = require('./routes/users');

router.use('/', index);
router.use('/users', users);

module.exports = router;