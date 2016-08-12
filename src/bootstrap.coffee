app = require './app'
socket = require './socket'
debug = require('debug')('ShareTalk:server')
http = require 'http'
mongoose = require 'mongoose';

mongoose.connect("mongodb://localhost/share_talk");

app.set 'port', port = 3030

# 基于 express 创建服务实例
server = http.createServer app

# 为服务端附加 web socket 处理
socket server

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