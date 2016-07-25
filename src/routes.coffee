###
  路由配置
###

express = require 'express'
authFilter = require './filters/auth';
loginController = require './controllers/login.controller';
usersController = require './controllers/users.controller';

router = express.Router()

# router.use(authFilter);
router.use '/login', loginController;
router.use '/users', usersController;

module.exports = router;