module.exports =
  init: (module) ->
    ###*
     # @ngdoc function
     # @name utttApp.controller:AuthCtrl
     # @description
     # # AuthCtrl
     # Controller of the utttApp
    ###
    module.controller 'GamesCtrl', ['$scope','$location','$resource','Facebook',
      ($scope,$location,$resource,Facebook) ->
        setup = (id) ->
          Games = $resource '/game', {}, {
            findGames: {
              method: 'GET',
              params: {userID: id}
            }
          }
          $scope.newGame = (friend) ->
            $scope.user.t = 'X'
            friend.t = 'O'
            newGame = new Games {players:[$scope.user,friend]}
            newGame.$save (u) ->
              $location.path '/game/' + u.id
          $scope.otherPlayer = (game) ->
            if game.players[0].id == id then game.players[1] else game.players[0]
          Games.query {}, (res) ->
            res.$promise.then (games) ->
              $scope.games = games
              console.log games

        if $scope.user
          setup $scope.user.id
        else
          $scope.$watch 'user', (newValue,oldValue) ->
            if newValue
              setup newValue.id

    ]
