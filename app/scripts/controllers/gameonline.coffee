UTTT = require '../game.coffee'

module.exports =
  init: (module) ->
    ###*
     # @ngdoc function
     # @name utttApp.controller:GameonlineCtrl
     # @description
     # # GameonlineCtrl
     # Controller of the utttApp
    ###
    module.controller 'GameOnlineCtrl', ($scope) ->
      $scope.game = new UTTT.Game()
