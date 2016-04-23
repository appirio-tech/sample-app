'use strict'

LogoutController = (
    $log
    $rootScope
    $location
    $state
    $cookies
    constants
    AuthService) ->
  
  vm = this

  init = ->
    $log.info "****** LOGGED OUT ******"
    $cookies.remove 'tcjwt', constants.COOKIE_SPEC.create()
    $cookies.remove 'tcsso', constants.COOKIE_SPEC.create()
    $state.go 'home'
    vm

  init()

LogoutController.$inject = [
  '$log'
  '$rootScope'
  '$location'
  '$state'
  '$cookies'
  'constants'
  'AuthService'
]

angular.module('sample').controller 'LogoutController', LogoutController
