###
  用户模块
###

define [
  'angular'
  'views/user/user.list'
  'views/user/login'
], (ng) ->
  ng.module 'shareTalk.views.user', [
    'shareTalk.views.user.list'
    'shareTalk.views.user.login'
  ]