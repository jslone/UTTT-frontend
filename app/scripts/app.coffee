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
      .when '/games'
        templateUrl: 'views/games.html'
        controller: 'GamesCtrl'
      .otherwise
        redirectTo: '/'

angular.module('utttApp',[
    'facebook'
  ])
  .config (FacebookProvider) ->
    FacebookProvider.init '1046434812049317'

app = angular.module 'utttApp'

require('./controllers/games.coffee').init app
require('./controllers/game.coffee').init app
require('./directives/subboard.coffee').init app
