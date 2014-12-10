'use strict'

###*
 # @ngdoc directive
 # @name utttApp.directive:subboard
 # @description
 # # subboard
###
angular.module('utttApp')
  .directive('subboard', ->
    templateUrl: 'views/subboard.html'
    restrict: 'ACE'
    link: (scope, element, attrs) ->
      element.text 'this is the subboard directive'
  )
