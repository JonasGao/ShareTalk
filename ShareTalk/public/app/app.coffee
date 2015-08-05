###
  主模块定义
  Created by jonas on 2015-08-05 23:52:29
###

define [
  "angular"
  "angular-route"
], (angular) ->
  angular.module "ShareTalk", ["ngRoute"]
  .config ($routeProvider) ->
    $routeProvider.when "/",
      templateUrl: "app/index/index.tpl.html"
      controller: "indexController"
  .controller "indexController", ($scope) ->
    $scope.title = "Hello world! "