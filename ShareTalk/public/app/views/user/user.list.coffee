###
  用户管理列表模块
  - 用户列表页面控制器
###

define [
  'angular'
  'angular-route'
  'angular-resource'
], (angular) ->
  angular.module 'shareTalk.user.list', [
    'ngRoute'
    'ngResource'
  ]

  .config ($routeProvider) ->
    $routeProvider.when '/user/list',
      templateUrl: 'app/views/user/user.list.tpl.html'
      controller: 'userListController'
      controllerAs: 'model'

  .controller 'userListController', class
    constructor: ($users) ->
      @users = []
      $users.get (users) =>
        @users = users


  .factory '$users', ($resource) ->
    $resource '/users'
    