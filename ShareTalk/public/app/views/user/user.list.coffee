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
    constructor: ($users, $modal) ->
      @$modal = $modal;
      @$users = $users;

      @userGrid =
        enableSorting: false
        columnDefs: [{field: 'mail'}, {field: 'username'}]
        data: []
      @$users.query (arr) =>
        @userGrid.data = arr

    openAddUser: ->
      modelController = ($scope, $modalInstance) ->
        $scope.user = {}
        $scope.ok = ->
          $modalInstance.close $scope.user
        $scope.cancel = ->
          $modalInstance.dismiss 'cancel'
      modelInstance = @$modal.open
        size: 'sm'
        animation: true
        templateUrl: 'addUser.tpl.html'
        controller: modelController
      modelInstance.result.then (user) =>
        @addUser user

    addUser: (user)->
      @$users.save user, () =>
        @userGrid.data.unshift user

  .factory '$users', ($resource) ->
    $resource '/users'
    