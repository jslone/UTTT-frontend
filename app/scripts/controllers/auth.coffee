module.exports =
  init: (module) ->
    ###*
     # @ngdoc function
     # @name utttApp.controller:AuthCtrl
     # @description
     # # AuthCtrl
     # Controller of the utttApp
    ###
    module.controller 'AuthCtrl', ['$scope','Facebook',
      ($scope,Facebook) ->
        $scope.login = () ->
          Facebook.login (res) ->
            if res.status == 'connected'
              $scope.load()
          ,{scope:'user_friends'}

        $scope.getLoginStatus = () ->
          Facebook.getLoginStatus (res) ->
            if res.status == 'connected'
              $scope.load()

        $scope.me = () ->
          Facebook.api '/me', (res) ->
            $scope.user = res

        $scope.getFriends = () ->
          Facebook.api '/me/friends', (res) ->
            $scope.friends = res.data
            $scope.$digest()

        $scope.inviteFriends = () ->
          Facebook.ui
            method: 'apprequests'
            message: 'Lets play a game of Ultimate Tic Tac Toe!'

        $scope.load = () ->
          $scope.me()
          $scope.getFriends()

        $scope.getLoginStatus()
    ]
