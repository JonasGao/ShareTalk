define ["angular", 'socket.io', "angular-route", 'services/user'], (angular, io) ->
  angular.module "shareTalk.views.chat", ["ngRoute", 'shareTalk.services.user']
  .config ($routeProvider) ->
    $routeProvider.when "/chat",
      templateUrl: "app/views/chat/chat.tpl.html"
      controller: "chatController"
      controllerAs: "model"

  .controller "chatController", class
    constructor: ($users) ->
      @$user = $users
      @content = ""
      @messages = []
      @socket = io();
      @socket.on 'posted', (data) -> alert(data.message)

    send: ->
      @socket.emit 'post', @content

      @messages.unshift
        sender: "user 1"
        content: @content
      @content = ""
