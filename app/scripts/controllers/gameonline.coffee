'use strict'

###*
 # @ngdoc function
 # @name utttApp.controller:GameonlineCtrl
 # @description
 # # GameonlineCtrl
 # Controller of the utttApp
###
angular.module('utttApp')
  .controller 'GameOnlineCtrl', ($scope) ->
    $scope.game = new Game
