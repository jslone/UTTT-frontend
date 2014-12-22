module.exports =
  init: (module) ->
    ###*
     # @ngdoc directive
     # @name utttApp.directive:subboard
     # @description
     # # subboard
    ###
    module.directive('subboard', ->
      templateUrl: 'views/subboard.html'
      restrict: 'ACE'
      scope:
        move: '&'
        board: '='
    )
