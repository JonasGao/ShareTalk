###
  Created by jonas on 2015-08-05 23:52:29
###

define [
  "angular"
  "angular-route"
  "angular-resource"
  "angular-ui"
  "angular-ui-grid"
  "views/chat/chat"
  "views/user/user"
], (angular) ->
  class menuController
    constructor: ->
# do nothing

  angular.module "shareTalk", [
    "ngRoute"
    "ngResource"
    "ui.bootstrap"
    "ui.grid"
    "shareTalk.chat"
    "shareTalk.user"
  ]

  .controller 'menuController', menuController
  .config ($routeProvider) ->
    $routeProvider.otherwise
      template: '<div class="container-fluid">other wise</div>'