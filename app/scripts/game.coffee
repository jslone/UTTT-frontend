wins = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

add = (obj1,obj2) ->
  for k of obj2
    obj1[k] = obj2[k]
  obj1

class Game
  board: add (add ({t:''} for i in [1..9]), {t:''} for i in [1..9]), {t:''}
  activeSub: -1
  turn: 0
  players: [{id:0,t:'X',name:'X'},{id:1,t:'O',name:'O'}]

  constuctor: ({@board,@activeSub,@turn,@players}) ->

  findWinner: (board) ->
    open = false
    for win in wins
      [i,j,k] = win
      if board[i].t != '' && board[i].t != 'C'
        if board[i].t == board[j].t && board[i].t == board[k].t
          return board[i].t
      else
        open = board[i].t == '' || board[j].t == '' || board[k].t == ''
    return if open then '' else 'C'

  canMove: (i,j,player) ->
    player.id == @players[@turn].id &&
    (i == @activeSub || @activeSub < 0) &&
    @board[i][j].t == '' &&
    @board.t == ''

  move: (i,j,player) ->
    if @canMove i,j,player
      @board[i][j].t = player.t
      @board[i].t = @findWinner @board[i]
      @activeSub = if @board[i].t == '' then j else -1
      @board.t = @findWinner @board
      @turn = (@turn + 1) % @players.length
      return true
    return false

  rateBoard: (board) ->
    if board.t == 'X'
      1
    else if board.t == 'O'
      0
    else if board.isArray
      Ps = (rateBoard())
    else
      0.5

module.exports =
  Game: Game
