###
  Created by jonas on 2015-08-05 23:52:29
###

define [
  "angular"
  "views/chat/chat"
  "views/user/user.module"
], (angular) ->
  angular.module "shareTalk", [
    "shareTalk.views.user"
    "shareTalk.views.chat"
  ]

  .controller 'menuController', (->)
  .factory '$redirect', ($location, $q) ->
    response: (res)->
      if res.data.redirect
        return $q (a, b)->
          $location.path res.data.redirect
          b()
      res

  .config ($routeProvider) ->
    $routeProvider.otherwise
      template: '<div class="container-fluid">other wise</div>'
  .config ($httpProvider) ->
    $httpProvider.interceptors.push '$redirect'