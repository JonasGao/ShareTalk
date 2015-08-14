###
  require 主定义文件
###

require.config
  baseUrl: 'app'

  packages: [
    name: 'css'
    location: '/dep/javascripts/require'
    main: 'css'
  ]

  paths:
    'jquery': '/dep/javascripts/jquery/jquery'
    'angular': '/dep/javascripts/angular/angular'
    'angular-route': '/dep/javascripts/angular/angular-route'
    'angular-ui': '/dep/javascripts/angular-ui/ui-bootstrap-tpls-0.13.2'
    'angular-ui-grid': '/dep/javascripts/angular-ui/ui-grid-3.0.1.min'
    'angular-resource': '/dep/javascripts/angular/angular-resource'
    'socket.io': '/dep/javascripts/socket.io-1.3.5'

  shim:
    'jquery': {exports: '$'}
    'angular': {exports: 'angular', deps: ['jquery']}
    'angular-route': {exports: 'angular-route', deps: ['angular']}
    'angular-ui': {deps: ['angular']}
    'angular-resource': {deps: ['angular']}
    'angular-ui-grid': {deps: ['angular', 'css!/dep/stylesheets/ui-grid-3.0.1.min']}

require [
  'app'
  'css!/dep/stylesheets/bootstrap.min'
  'css!/dep/stylesheets/bootstrap-theme.min'
], () -> angular.bootstrap(document, ['shareTalk'])
