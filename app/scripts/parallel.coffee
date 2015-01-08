UTTT = require './game.coffee'
Utils = require './utils.coffee'

self.addEventListener 'message', (e) ->
  game = new UTTT.Game e.data.game
  move = game.bestMove()
  self.postMessage {move: move}
