###
  全局授权拦截器
###

User = require '../modules/User'

# 定义那些需要跳过
skipUrls = [
  '/'
  '/login'
  '/index'
]

# 判断当前路径是否可以跳过
canSkip = (req) ->
  return true for i in skipUrls when i is req.url

# 授权验证的过滤器
filter = (req, res, next) ->
  if canSkip req
    # 如果是 GET 或登陆请求 则不需要验证，
    console.log '已跳过: ' + req.url
    next()

  else if req.session.user
    # 否则，都需要进行 Session 验证
    console.log "通过验证: #{req.session.user.username}@#{req.url}"
    next()

  else
    # 否则跳转到登陆页面
    console.log '未授权请求'
    res.json redirect:'/login'


module.exports = filter;