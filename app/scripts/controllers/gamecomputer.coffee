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
      $scope.player = $scope.game.players[0]
      # have ai make move
      $scope.endTurn = () ->
      $scope.move = (i,j) ->
        if $scope.game.move i, j, $scope.player
          $scope.endTurn()
