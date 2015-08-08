define [
  "angular"
  "cs!views/user/user.list"
], (angular) ->
  angular.module "shareTalk.user", [
    "ngRoute"
    "shareTalk.user.list"
  ]