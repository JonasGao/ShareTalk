###
  封装与聊天相关的 WebSocket 内容，基于 Socket.IO
###

define [
  'angular'
  'socket.io'
], (angular, io) ->
  angular.module 'shareTalk.services.socket.chat', []
  .service '$chat', class
    socket: null
    connect: ->
      @socket = io()
      @socket.on 'posted', (data) -> alert(data.message)
    send: (content) ->
      @socket.emit 'post', content