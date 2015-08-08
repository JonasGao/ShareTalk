###
  全局授权拦截器
###

User = require '../modules/User'

contain = (str, partStr) ->
  str.indexOf partStr > -1

canSkip = (req) ->
  req.url.indexOf 'log' or
  req.url.indexOf 'doLogin'

authFilter = (req, res, next) ->
  if canSkip req
# 如果是 GET 或登陆请求 则不需要验证，
    console.log '已跳过登录验证: ' + req.url
    next()

  else if req.session.user
# 否则，都需要进行 Session 验证
    console.log "通过验证: #{req.url}: #{req.session.user.username}"
    next()

  else
# 否则跳转到登陆页面
    res.redirect '/login'


module.exports = authFilter;