'use strict'

dependencies = [
  'ui.router'
  'appirio-tech-ng-auth'
]

angular.module 'sample', dependencies


config = ($locationProvider, $stateProvider) ->
  states = {}

  $locationProvider.html5Mode true

  # customer routes
  
  states['home'] =
    url         : '/'
    title       : 'Home'
    controller  : 'HomeController as vm'
    template    : require('./views/home')()

  states['logout'] =
    url         : '/logout'
    controller  : 'LogoutController'
  
  for key, state of states
    $stateProvider.state key, state

config.$inject = ['$locationProvider', '$stateProvider']

angular.module('sample').config config


constants =
  LOGIN_RETURN_URL:   process.env.LOGIN_RETURN_URL
  LOGOUT_RETURN_URL:  process.env.LOGOUT_RETURN_URL
  ACCOUNTS_LOGIN_URL: process.env.ACCOUNTS_LOGIN_URL
  ACCOUNTS_LOGOUT_URL:process.env.ACCOUNTS_LOGOUT_URL

angular.module('sample').constant 'constants', constants

