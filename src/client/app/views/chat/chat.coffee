###
  chat 聊天画面的控制器
###

define [
  'angular'
  'angular-route'
  'services/user'
  'services/socket/chat'
], (angular) ->
  angular.module 'shareTalk.views.chat', [
    'ngRoute'
    'shareTalk.services.user'
    'shareTalk.services.socket.chat'
  ]
  .config ($routeProvider) ->
    $routeProvider.when '/chat',
      templateUrl: 'app/views/chat/chat.tpl.html'
      controller: 'chatController'
      controllerAs: 'model'

  .controller 'chatController', class
    constructor: (@$users, @$chat) ->
      @content = ''
      @messages = []

    connect: ->

    send: ->
      @$chat.send 'aaaa'
