'use strict'

HomeController = (
  $log
  $rootScope
  $window
  $location
  $state
  $cookies
  constants
  AuthService
  TokenService) ->
  
  vm = this

  # cehck if user is logged in  
  vm.isLoggedIn = ->
    AuthService.isLoggedIn()
  
  # redirect to accounts.topcoder.com to log in to the system.
  # with specifying the callback url on 'retUrl' parameter.
  # e.g. https://accounts.topcoder-dev.com/login?retUrl=https%3A%2F%2Fsample.topcoder-dev.com%2F
  vm.login = ->
    accountsUrl = constants.ACCOUNTS_LOGIN_URL + '?retUrl=' + encodeURIComponent(constants.LOGIN_RETURN_URL) 
    $log.info 'redirect to '　+ accountsUrl
    $window.location = accountsUrl
  
  # redirect to accounts.topcoder.com to log out from the system.
  # with specifying the callback url on 'retUrl' parameter.
  # e.g. https://accounts.topcoder-dev.com/logout?retUrl=https%3A%2F%2Fsample.topcoder-dev.com%2F
  vm.logout = ->
    AuthService.logout()
    accountsUrl = constants.ACCOUNTS_LOGOUT_URL + '?retUrl=' + encodeURIComponent(constants.LOGOUT_RETURN_URL) 
    $log.info 'redirect to '　+ accountsUrl
    $window.location = accountsUrl
  
  # handle callback
  # https://sample.topcoder-dev.com/?jwt=.....&tcjwt=....&tcsso=.....
  # - jwt  : v3 jwt
  # - tcjwt: v2 jwt
  # - tcsso: sso token
  init = ->
    if $location.search().jwt
      TokenService.setAppirioJWT $location.search().jwt
      if AuthService.isLoggedIn()  
        vm.username = TokenService.decodeToken().handle
    if $location.search().tcjwt
      $cookies.put 'tcjwt', $location.search().tcjwt, constants.COOKIE_SPEC.create()
    if $location.search().tcsso
      $cookies.put 'tcsso', $location.search().tcsso, constants.COOKIE_SPEC.create()
    $state.go 'home'
    vm
  
  init()
  

HomeController.$inject = [
  '$log'
  '$rootScope'
  '$window'
  '$location'
  '$state'
  '$cookies'
  'constants'
  'AuthService'
  'TokenService'
]

angular.module('sample').controller 'HomeController', HomeController
