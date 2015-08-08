define ["angular", "angular-route"], (angular) ->
  angular.module "shareTalk.chat", ["ngRoute"]

  .config ($routeProvider) ->
    $routeProvider.when "/chat",
      templateUrl: "app/views/chat/chat.html"
      controller: "chatController"
      controllerAs: "model"

  .controller "chatController", class
    constructor: ->
      @content = ""
      @messages = []

    send: ->
      @messages.unshift
        sender: "user 1"
        content: @content
      @content = ""
