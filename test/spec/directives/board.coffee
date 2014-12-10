'use strict'

describe 'Directive: board', ->

  # load the directive's module
  beforeEach module 'utttApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<board></board>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the board directive'
