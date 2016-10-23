express = require 'express'
path = require 'path'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
session = require 'express-session'
SocketServer = require 'socket.io'
http = require 'http'

debug = require('debug')('ShareTalk:server')
sessionMiddleWare = session({secret: "share-talk"})

# 启动数据访问
require './mongo'

# 创建服务应用
app = express();
app.set 'port', port = 3000

# 注册中间件
app.use logger('dev')
app.use express.static(path.join(__dirname, '../../public'))
app.use cookieParser()
app.use sessionMiddleWare
app.use bodyParser.json()
app.use bodyParser.urlencoded({extended: false});

# 基于 express 创建服务实例
server = http.createServer app

# 创建 web socket server
io = new SocketServer(server)
# 为 web socket 注册 session 中间件，促使 io 和 express 共享 session
io.use (socket, next) ->
  sessionMiddleWare socket.request, socket.request.res, next
# 注册回调
io.on 'connection', require('./socket');

# 加载路由
app.use require('./routes');

# catch 404 and forward to error handler
app.use((req, res, next) ->
  err = new Error('Not Found');
  err.status = 404;
  next(err);
);

# error handlers

# development error handler
# will print stacktrace
if (app.get('env') is 'development')
  app.use((err, req, res) ->
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  );

# production error handler
# no stacktraces leaked to user
app.use((err, req, res) ->
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
);

# 启动监听
server.listen port

server.on 'error', (error) ->

  if error.syscall isnt 'listen'
    throw error

  bind = if typeof port is 'string' then 'Pipe ' + port else 'Port ' + port

  switch error.code

    when 'EACCES'
      console.error(bind + ' requires elevated privileges')
      process.exit(1)

    when 'EADDRINUSE'
      console.error(bind + ' is already in use')
      process.exit(1)

    else throw error;

server.on 'listening', () ->

  addr = server.address()

  bind = if typeof addr is 'string' then ('pipe ' + addr) else ('port ' + addr.port)

  debug('Listening on ' + bind)

exports.app = app
exports.io = io
exports.server = server