###
  Created by jonas on 2015-08-05 23:52:29
###

define [
  "angular"
  "views/chat/chat"
  "views/user/user.module"
], (angular) ->
  class MenuController

  class Redirect
    constructor: (@$location)->
    response: (res)=>
      if res.data.redirect
        @$location.path res.data.redirect
      res

  angular.module "shareTalk", [
    "shareTalk.views.user"
    "shareTalk.views.chat"
  ]

  .controller 'menuController', MenuController
  .service '$redirect', Redirect

  .config ($routeProvider) ->
    $routeProvider.otherwise
      template: '<div class="container-fluid">other wise</div>'
  .config ($httpProvider) ->
    $httpProvider.interceptors.push '$redirect'