UTTT = require '../game.coffee'
Utils = require '../utils.coffee'

module.exports =
  init: (module) ->
    ###*
     # @ngdoc function
     # @name utttApp.controller:GameofflineCtrl
     # @description
     # # GameofflineCtrl
     # Controller of the utttApp
    ###
    module.controller 'GameCtrl', ['$scope', '$routeParams', '$resource'
      ($scope,$routeParams,$resource) ->
        # try to make a move, works for each game type
        $scope.move = (i,j) ->
          if $scope.game.move i, j, $scope.player
            $scope.endTurn i,j

        # local offline game
        if $routeParams.id <= 2
          $scope.game = new UTTT.Game()
          # set player 1 as current player
          $scope.player = $scope.game.players[0]
          if $routeParams.id == '1'
            # set up worker to play for computer
            worker = new Worker '/scripts/parai.js'
            worker.addEventListener 'message', (e) ->
              {i,j} = e.data.move
              $scope.game.move i, j, $scope.game.players[1]
              $scope.$digest()
            # let ai know it is its turn
            $scope.endTurn = () ->
              # signal ai worker
              worker.postMessage {game: $scope.game}
          if $routeParams.id == '2'
            # toggle current player
            $scope.endTurn = () ->
              $scope.player = $scope.game.players[$scope.game.turn]
        #online game
        else
          Games = $resource '/game/:id', {id:$routeParams.id},
            move:
              method: 'POST'
              url: '/game/move/:id'
          # disable move until game loaded
          moveFn = $scope.move
          $scope.move = ->
          # load game
          Games.get {}, (res) ->
            res.$promise.then (game) ->
              $scope.game = new UTTT.Game game
              $scope.move = moveFn
              # send move to server
              $scope.endTurn = (i,j) ->
                game.$move {i:i,j:j,userID:$scope.user.id}
          # social network player info
          $scope.player = $scope.user
    ]
