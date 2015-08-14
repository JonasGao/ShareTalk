###
  soket 服务端
###

socket = require 'socket.io'
io = null

startup = (server) ->
  io = socket server
  # 每次出发即为创建一个连接
  io.on 'connection', (socket) ->
    # socket 为每次新建的连接对象
    socket.on 'post', (data) ->
      socket.emit 'posted', message: 'hello, ' + data

module.exports = startup