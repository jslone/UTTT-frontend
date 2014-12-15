'use strict'

describe 'Controller: GamecomputerCtrl', ->

  # load the controller's module
  beforeEach module 'utttApp'

  GamecomputerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    GamecomputerCtrl = $controller 'GamecomputerCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
