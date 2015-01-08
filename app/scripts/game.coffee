AI = require './negamax.coffee'
Utils = require './utils.coffee'

class Game
  wins: [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  calculateProb: (Ps,d=false) ->
    P = 0
    winMasks = 1 << @wins.length
    for mask in [1...winMasks] by 1
      color = 2 * (Utils.bitParity8 mask) - 1
      Pmask = 0
      for i in [0...@wins.length] by 1
          if mask & (1<<i)
            Pmask |= (1<<@wins[i][0]) | (1<<@wins[i][1]) | (1<<@wins[i][2])
      sum = 1
      for i in [0...Ps.length]
        if Pmask & (1<<i)
          sum *= Ps[i]
      P += color*sum
    P

  constructor: (options = null) ->
    if options == null
      @board = Utils.add (Utils.add ({t:''} for i in [1..9]), {t:''} for i in [1..9]), {t:''}
      @activeSub = -1
      @turn = 0
      @players = [{id:0,t:'X',name:'X'},{id:1,t:'O',name:'O'}]
    else
      @board = Utils.add (Utils.add ({t:i.t} for i in sub), {t:sub.t} for sub in options.board), {t:options.board.t}
      @activeSub = options.activeSub
      @turn = options.turn
      @players = options.players

  findWinner: (board) ->
    open = false
    for win in @wins
      [i,j,k] = win
      if board[i].t != '' && board[i].t != 'C'
        if board[i].t == board[j].t && board[i].t == board[k].t
          return board[i].t
      else
        open |= board[i].t == '' || board[j].t == '' || board[k].t == ''
    return if open then '' else 'C'

  canMove: (i,j,player) ->
    player.id == @players[@turn].id &&
    (i == @activeSub || @activeSub < 0) &&
    @board[i][j].t == '' &&
    @board.t == ''

  move: (i,j,player = @players[@turn]) ->
    if @canMove i,j,player
      @board[i][j].t = player.t
      @board[i].t = @findWinner @board[i]
      @activeSub = if @board[j].t == '' then j else -1
      @board.t = @findWinner @board
      @turn = (@turn + 1) % @players.length
      return true
    return false

  rateBoard: (board,t,d=false) ->
    other = if t == 'X' then 'O' else 'X'
    if board.t == t
      1
    else if board.t == other
      0
    else if Array.isArray board
      Pws = (@rateBoard sub,t for sub in board)
      Pls = (@rateBoard sub,other for sub in board)
      Pw = @calculateProb Pws
      Pl = @calculateProb Pls
      if d
        console.log Pws
        console.log Pw,Pl
      Math.sqrt(Pw) * Math.sqrt(1 - Pl)
    else
      0.5

  value: ->
    @rateBoard @board,'X'

  open: ({i,j}) ->
    @board[i][j].t == ''

  filterOpen: (moves) ->
    moves.filter @open.bind(this)

  findMoves: ->
    if @activeSub < 0
      @filterOpen (Utils.flatten ({i:i,j:j} for i in [0..8] for j in [0..8]))
    else
      @filterOpen ({i:@activeSub,j:j} for j in [0..8])

  bestMove: ->
    color = -2 * @turn + 1
    node = new GameNode this
    AI.negamax node, 10000, Number.NEGATIVE_INFINITY, Number.POSITIVE_INFINITY, color
    node.bestDelta

class GameNode
  constructor: (@game,move = null) ->
    if move?
      @game.move move.i,move.j
      @delta = move
  isTerminal: ->
    @game.board.t != ''
  getChildren: ->
    (new GameNode (new Game @game), move for move in @game.findMoves())
  value: ->
    @game.value()
  applyDelta: ->
    @game.move @bestDelta


module.exports =
  Game: Game
