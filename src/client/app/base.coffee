###
  底层通过模块
###

define [
  'angular'
  'angular-route'
  'angular-ui'
  'angular-ui-grid'
], (ng) ->
  ng.module 'shareTalk.base', [
    'ngRoute'
    'ui.bootstrap'
    'ui.grid'
  ]