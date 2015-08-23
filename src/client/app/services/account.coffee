###
  登录
###

define [
  'angular'
], (angular) ->
  angular.module 'shareTalk.services.account', []
  .service '$account', class
    constructor: (@$http) ->
    current: null
    login: (mail, password) ->
      @$http.post '/login', mail: mail, password: password
      .then (res) =>
        if res.data?.username?
          @current = res.data
          return true
        console.log res
        return false



