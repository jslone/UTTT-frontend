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
          ,{scope:'user_friends,apprequests'}

        $scope.getLoginStatus = () ->
          Facebook.getLoginStatus (res) ->
            if res.status == 'connected'
              $scope.userID = res.authResponse.userID
              $scope.me()
              $scope.getFriends()
            else
              $scope.login()

        $scope.me = () ->
          Facebook.api '/me', (res) ->
            $scope.user = res

        $scope.getFriends = () ->
          Facebook.api '/me/friends', (res) ->
            console.log res
            $scope.friends = res.data

        $scope.inviteFriends = () ->
          Facebook.ui
            method: 'apprequests'
            message: 'Lets play a game of Ultimate Tic Tac Toe!'


        $scope.getLoginStatus()
    ]
