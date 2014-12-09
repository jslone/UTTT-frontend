'use strict'

###*
 # @ngdoc function
 # @name utttApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the utttApp
###
angular.module('utttApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
