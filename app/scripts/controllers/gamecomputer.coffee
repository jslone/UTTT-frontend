'use strict'

###*
 # @ngdoc function
 # @name utttApp.controller:GamecomputerCtrl
 # @description
 # # GamecomputerCtrl
 # Controller of the utttApp
###
angular.module('utttApp')
  .controller 'GameComputerCtrl', ($scope) ->
    $scope.game = new Game
