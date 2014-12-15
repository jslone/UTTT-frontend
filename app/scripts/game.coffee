class Game
  constuctor: (boardData) ->
    if boardData?
      @winner = boardData.winner
      @board = boardData.board
      @subboard = boardData.subboard
      @activeSub = boardData.activeSub
      @turn = boardData.turn
      @players = boardData.players
    else
      @winner = ''
      @board = ('' for i in [1..9])
      @subboard = (('' for i in [1..9]) for i in [1..9])
      @activeSub = -1
      @turn = 0
      @player = [{id:0,t:'X'},{id:1,t:'O'}]

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
      if board[win[0]] != '' && board[win[0]] != 'C'
        if board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]]
          return board[win[0]]
      else
        open = board[win[0]] != 'C'
    return open ? '' : 'C'

  move: (i,j,pid) ->
    if pid == @player[@turn].id && (i == @activeSub || @activeSub < 0)
      if @subboard[i][j] == ''
        @subboard[i][j] = t
        @board[i] = findWinner @subboard[i]
        @winner = findWinner @board
        @turn = (@turn + 1)%2
