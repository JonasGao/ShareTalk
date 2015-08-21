###
  登录
###

define [
  'angular'
], (ng) ->
  ng.module 'shareTalk.services.account', []
  .service '$account', [
    '$http'
    class
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
  ]



