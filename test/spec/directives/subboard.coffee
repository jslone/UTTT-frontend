'use strict'

describe 'Directive: subboard', ->

  # load the directive's module
  beforeEach module 'utttApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<subboard></subboard>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the subboard directive'
