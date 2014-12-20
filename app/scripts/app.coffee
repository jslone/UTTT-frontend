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
      .when '/game/computer',
        templateUrl: 'views/board.html'
        controller: 'GameComputerCtrl'
      .when '/game/offline',
        templateUrl: 'views/board.html'
        controller: 'GameOfflineCtrl'
      .otherwise
        redirectTo: '/'

app = angular.module 'utttApp'
require('./controllers/gamecomputer.coffee').init app
require('./controllers/gameoffline.coffee').init app
require('./controllers/gameonline.coffee').init app
require('./directives/subboard.coffee').init app
