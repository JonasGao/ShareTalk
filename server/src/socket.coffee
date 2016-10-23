module.exports = (socket) ->
  # 接收前台消息
  socket.on 'post', (data) ->
    # 向前台广播接收到的新消息
    io.emit 'posted', message: data.nickname + ' 说: ' + data.message

  socket.on 'disconnect', () ->