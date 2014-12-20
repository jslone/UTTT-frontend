UTTT = require '../game.coffee'

module.exports =
  init: (module) ->
    ###*
     # @ngdoc function
     # @name utttApp.controller:GamecomputerCtrl
     # @description
     # # GamecomputerCtrl
     # Controller of the utttApp
    ###
    module.controller 'GameComputerCtrl', ($scope) ->
      $scope.game = new UTTT.Game()
