###
  登录页面
###

define [
  'angular'
  'base'
  'services/account'
], (ng) ->
  ng.module 'shareTalk.views.user.login', [
    'shareTalk.base'
    'shareTalk.services.account'
  ]
  .config [
    '$routeProvider'
    ($route) -> $route.when '/login',
      templateUrl: 'app/views/user/login.tpl.html'
      controller: 'LoginController'
      controllerAs: 'model'
  ]
  .controller 'LoginController', [
    '$account'
    '$location'
    class
      constructor: (@$account, @$location) ->
      user:
        mail: ''
        password: ''
      login: ->
        @$account.login @user.mail, @user.password
        .then (result) => if result then @$location.path '/' else alert 'fail'
  ]
