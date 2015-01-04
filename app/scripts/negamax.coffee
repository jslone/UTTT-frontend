negamax = (node,depth,a,b,color) ->
  if depth == 0 || node.isTerminal()
    node.v = color*node.value()
    return

  node.v = Number.NEGATIVE_INFINITY
  children = node.getChildren()
  for child in node.getChildren()
    negamax child,depth-1,-b,-a,-color
    child.v = -child.v
    if child.v > node.v
      node.v = child.v
      node.bestDelta = child.delta
    a = Math.max a, child.v
    if a >= b
      break


class Node
  isTerminal: ->
    true
  getChildren: ->
    []
  value: ->
    0
  applyDelta: ->

class TestNode
  constructor: (@data) ->
  isTerminal: ->
    typeof @data == 'number'
  getChildren: ->
    (new TestNode v for k,v of @data)
  value: ->
    @data

test = new TestNode [
  [[[3,17],[2,12]],[[15],[25,0]]]
  [[[2,5],[3]],[[2,14]]]
]

negamax test, 5, Number.NEGATIVE_INFINITY, Number.POSITIVE_INFINITY,1
console.log test.v

module.exports =
  negamax: negamax
