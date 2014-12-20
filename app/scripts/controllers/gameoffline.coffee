UTTT = require '../game.coffee'

module.exports =
  init: (module) ->
    ###*
     # @ngdoc function
     # @name utttApp.controller:GameofflineCtrl
     # @description
     # # GameofflineCtrl
     # Controller of the utttApp
    ###
    module.controller 'GameOfflineCtrl', ($scope) ->
      $scope.game = new UTTT.Game()
      $scope.player = $scope.game.players[0]
      $scope.endTurn = () ->
        $scope.player = $scope.game.players[$scope.game.turn]
      $scope.test = 'test'
      $scope.move = (i,j) ->
        console.log i,j
        if $scope.game.move i, j, $scope.player
          $scope.endTurn()
