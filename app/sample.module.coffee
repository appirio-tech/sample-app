'use strict'

# Module
dependencies = [
  'ui.router'
  'ngCookies'
  'appirio-tech-ng-auth'
]

angular.module 'sample', dependencies


# Configuration
config = ($locationProvider, $stateProvider) ->
  states = {}

  $locationProvider.html5Mode true

  # customer routes
  # Root
  states['home'] =
    url         : '/?jwt'
    title       : 'Home'
    controller  : 'HomeController as vm'
    template    : require('./views/home')()

  # Logout (TODO: This does not work with the accounts site)
  states['logout'] =
    url         : '/logout'
    controller  : 'LogoutController as vm'
  
  states['resetPassword'] =
    url         : '/reset-password?handle&token'
    controller  : 'ResetPasswordController as vm'
    template    : require('./views/reset-password')()
  
  for key, state of states
    $stateProvider.state key, state

config.$inject = ['$locationProvider', '$stateProvider']

angular.module('sample').config config


# Constants
# see webpack.config.js
constants =
  LOGIN_RETURN_URL    : process.env.LOGIN_RETURN_URL
  LOGOUT_RETURN_URL   : process.env.LOGOUT_RETURN_URL
  ACCOUNTS_LOGIN_URL  : process.env.ACCOUNTS_LOGIN_URL
  ACCOUNTS_LOGOUT_URL : process.env.ACCOUNTS_LOGOUT_URL
  COOKIE_SPEC :
    create: () ->
      path   : '/'
      domain : process.env.COOKIE_DOAMIN
      expires: new Date((new Date()).getTime() + (7776000 * 1000))

angular.module('sample').constant 'constants', constants

