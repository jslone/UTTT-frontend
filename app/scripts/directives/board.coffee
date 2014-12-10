'use strict'

###*
 # @ngdoc directive
 # @name utttApp.directive:board
 # @description
 # # board
###
angular.module('utttApp')
  .directive('board', ->
    templateUrl: 'views/board.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the board directive'
  )
