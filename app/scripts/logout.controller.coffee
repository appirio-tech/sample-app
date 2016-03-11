'use strict'

LogoutController = (
    $log
    $rootScope
    $location
    $state
    AuthService) ->
  
  vm = this

  init = ->
    $log.info "****** LOGGED OUT ******"
    AuthService.logout()
    $state.go 'home'
    vm

  init()

LogoutController.$inject = [
  '$log'
  '$rootScope'
  '$location'
  '$state'
  'AuthService'
]

angular.module('sample').controller 'LogoutController', LogoutController
