module.exports =
  init: (module) ->
    ###*
     # @ngdoc function
     # @name utttApp.controller:AuthCtrl
     # @description
     # # AuthCtrl
     # Controller of the utttApp
    ###
    module.controller 'AuthCtrl', ['$scope','$location','$resource','Facebook',
      ($scope,$location,$resource,Facebook) ->
        $scope.login = () ->
          Facebook.login (res) ->
            if res.status == 'connected'
              $scope.userID = res.authResponse.userID
              $scope.load()
          ,{scope:'user_friends'}

        $scope.getLoginStatus = () ->
          Facebook.getLoginStatus (res) ->
            if res.status == 'connected'
              $scope.userID = res.authResponse.userID
              $scope.load()

        $scope.me = () ->
          Facebook.api '/me', (res) ->
            $scope.user = res
            $scope.user.id = $scope.user.userID

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

        $scope.setUserID = (id) ->
          $scope.userID = id
          $scope.$digest()
          $scope.load()


        $scope.getLoginStatus()
    ]
