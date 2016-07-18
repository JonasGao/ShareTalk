define [
  "angular"
  'angular-resource'
], (angular) ->
  angular.module "shareTalk.services.user", ['ngResource']
  .factory '$users', ($resource) ->
    $resource '/users'