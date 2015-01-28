module.exports =
  init: (module) ->
    ###*
     # @ngdoc function
     # @name utttApp.controller:AuthCtrl
     # @description
     # # AuthCtrl
     # Controller of the utttApp
    ###
    module.controller 'GamesCtrl', ['$scope','Facebook',
      ($scope,Facebook) ->
        $scope.login = () ->
          Facebook.login (res) ->
            console.log res

        $scope.getFriends = () ->
          Facebook.api '/me/friends', (res) ->
            console.log res
    ]
