'use strict'

HomeController = (
  $log
  $rootScope
  $window
  $location
  $state
  constants
  AuthService
  TokenService) ->
  
  vm = this
  
  vm.isLoggedIn = ->
    AuthService.isLoggedIn()
  
  vm.login = ->
    accountsUrl = constants.ACCOUNTS_LOGIN_URL + '?retUrl=' + encodeURIComponent(constants.LOGIN_RETURN_URL) 
    $log.info 'redirect to '　+ accountsUrl
    $window.location = accountsUrl
  
  vm.logout = ->
    AuthService.logout()
    accountsUrl = constants.ACCOUNTS_LOGOUT_URL + '?retUrl=' + encodeURIComponent(constants.LOGOUT_RETURN_URL) 
    $log.info 'redirect to '　+ accountsUrl
    $window.location = accountsUrl
  
  init = ->
    if $location.search().jwt
      TokenService.setAppirioJWT $location.search().jwt
      if AuthService.isLoggedIn()  
        vm.username = TokenService.decodeToken().handle
      $state.go 'home'
    vm
  
  init()
  

HomeController.$inject = [
  '$log'
  '$rootScope'
  '$window'
  '$location'
  '$state'
  'constants'
  'AuthService'
  'TokenService'
]

angular.module('sample').controller 'HomeController', HomeController
