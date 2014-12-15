'use strict'

###*
 # @ngdoc overview
 # @name utttApp
 # @description
 # # utttApp
 #
 # Main module of the application.
###
angular
  .module('utttApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/game/computer',
        templateUrl: 'views/board.html'
        controller: 'GameComputerCtrl'
      .when '/game/offline',
        templateUrl: 'views/board.html'
        controller: 'GameOfflineCtrl'
      .otherwise
        redirectTo: '/'
