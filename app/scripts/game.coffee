class Game
  winner: ''
  board: ('' for i in [1..9])
  subboard: (('' for i in [1..9]) for i in [1..9])
  activeSub: -1
  turn: 0
  players: [{id:0,t:'X',name:'X'},{id:1,t:'O',name:'O'}]

  constuctor: ({@winner,@board,@subboard,@activeSub,@turn,@players}) ->

  findWinner: (board) ->
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
    open = false
    for win in wins
      [i,j,k] = win
      if board[i] != '' && board[i] != 'C'
        if board[i] == board[j] && board[i] == board[k]
          return board[i]
      else
        open = board[i] == '' || board[j] == '' || board[k] == ''
    return if open then '' else 'C'

  canMove: (i,j,player) ->
    player.id == @players[@turn].id && (i == @activeSub || @activeSub < 0) && @subboard[i][j] == ''

  move: (i,j,player) ->
    if @canMove i,j,player
      @subboard[i][j] = player.t
      @board[i] = @findWinner @subboard[i]
      @activeSub = if @board[i] == '' then j else -1
      @winner = @findWinner @board
      @turn = (@turn + 1) % @players.length
      return true
    return false

module.exports =
  Game: Game
