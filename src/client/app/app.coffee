###
  Created by jonas on 2015-08-05 23:52:29
###

define [
  "angular"
  "views/chat/chat"
  "views/user/user.module"
], (angular) ->
  class menuController
    constructor: ->
      # do nothing

  angular.module "shareTalk", [
    "shareTalk.views.user"
    "shareTalk.views.chat"
  ]

  .controller 'menuController', menuController
  .config ($routeProvider) ->
    $routeProvider.otherwise
      template: '<div class="container-fluid">other wise</div>'