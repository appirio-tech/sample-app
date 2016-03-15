'use strict'

ResetPasswordController = (
    $log
    $rootScope
    $location
    $window
    $state
    $stateParams
    constants
    AuthService) ->
  
  vm           = this
  vm.password  = ''
  vm.error     = false
  vm.loading   = false
  vm.token       = $stateParams.token
  vm.handle      = $stateParams.handle

  # "reset" button
  vm.submit = ->
    vm.error = false
    AuthService.resetPassword(vm.handle, vm.token, vm.password).then(success).catch(failure)

  # callback on success
  # redirect to accounts.topcoder.com to log in to the system.
  # with specifying handle, password and the callback url (retUrl).
  # e.g. https://accounts.topcoder-dev.com/logout?handle=jdoe&password=******&retUrl=https%3A%2F%2Fsample.topcoder-dev.com%2F
  success = ->
    accountsUrl = constants.ACCOUNTS_LOGIN_URL + '?handle=' + encodeURIComponent(vm.handle) + '&password=' + encodeURIComponent(vm.password) + '&retUrl=' + encodeURIComponent(constants.LOGIN_RETURN_URL) 
    $log.info 'redirect to '　+ accountsUrl
    $window.location = accountsUrl

  # callback on failure
  failure = (res) ->
    vm.error = res.data.result.content

  init = ->
    vm

  init()


ResetPasswordController.$inject = [
  '$log'
  '$rootScope'
  '$location'
  '$window'
  '$state'
  '$stateParams'
  'constants'
  'AuthService'
]

angular.module('sample').controller 'ResetPasswordController', ResetPasswordController
