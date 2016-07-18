###
  路由配置
###

express = require 'express'

router = express.Router()

authFilter = require('./filters/auth');

login = require('./controllers/login');
users = require('./controllers/users');

# router.use(authFilter);
router.use('/users', users);

module.exports = router;