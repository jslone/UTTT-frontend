'use strict'

describe 'Controller: GameonlineCtrl', ->

  # load the controller's module
  beforeEach module 'utttApp'

  GameonlineCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    GameonlineCtrl = $controller 'GameonlineCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
