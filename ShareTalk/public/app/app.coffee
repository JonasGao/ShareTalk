###
  主模块定义
  Created by jonas on 2015-08-05 23:52:29
###

define [
  "angular"
  "angular-route"
  "cs!views/chat"
], (angular) ->
  angular.module "ShareTalk", ["ngRoute", "ShareTalk.Chat"]
  .config ($routeProvider) ->
    $routeProvider.otherwise
      template: '<a href="#/chat">go to chat</a>'