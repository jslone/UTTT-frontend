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
      .when '/game/:id',
        templateUrl: 'views/board.html'
        controller: 'GameCtrl'
      .otherwise
        redirectTo: '/'

app = angular.module 'utttApp'
require('./controllers/game.coffee').init app
require('./directives/subboard.coffee').init app
