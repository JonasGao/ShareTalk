define ["angular", "angular-route"], (angular) ->
  angular.module "shareTalk.user.list", ["ngRoute"]

  .config ($routeProvider) ->
    $routeProvider.when "/user/list",
      templateUrl: "app/views/user/user.list.tpl.html"
      controller: "userListController"
      controllerAs: "model"

  .controller "userListController", class
    constructor: ->

