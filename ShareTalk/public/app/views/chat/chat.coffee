define ["angular", "angular-route", 'views/user/user'], (angular) ->
  angular.module "shareTalk.chat", ["ngRoute"]
  .config ($routeProvider) ->
    $routeProvider.when "/chat",
      templateUrl: "app/views/chat/chat.html"
      controller: "chatController"
      controllerAs: "model"

  .controller "chatController", class
    constructor: ($user) ->
      @$user = $user
      @content = ""
      @messages = []

    send: ->
      @messages.unshift
        sender: "user 1"
        content: @content
      @content = ""
