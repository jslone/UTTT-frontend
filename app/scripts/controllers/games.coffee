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

        $scope.newGame = (friend) ->
          Games = $resource '/game/:id', {}, {move: {method: 'POST'}}
          $scope.user.t = 'X'
          friend.id = friend.userID
          friend.t = 'O'
          newGame = new Games {players:[$scope.user,friend]}
          newGame.$save (u) ->
            $location.path '/game/' + u.id
    ]
