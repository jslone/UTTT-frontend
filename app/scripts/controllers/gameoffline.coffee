'use strict'

###*
 # @ngdoc function
 # @name utttApp.controller:GameofflineCtrl
 # @description
 # # GameofflineCtrl
 # Controller of the utttApp
###
angular.module('utttApp')
  .controller 'GameOfflineCtrl', ($scope) ->
    $scope.game = new Game
