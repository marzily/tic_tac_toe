class Check1DBoard
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def message
    if winner == "O"
      "The winner is O"
    elsif winner == "X"
      "The winner is X"
    end
  end

  def winner
    player = find_by_row || find_by_col
  end

  def find_by_row
    if check_row(0, 2)
      board[0]
    elsif check_row(3, 5)
      board[3]
    elsif check_row(6, 8)
      board[6]
    end
  end

  def check_row(x, y)
    board[x..y].all? {|space| space == "O" || space == "X" }
  end

  def find_by_col
    if col_match?(0, 3, 6)
      board[0]
    elsif col_match?(1, 4, 7)
      board[1]
    elsif col_match?(2, 5, 8)
      board[2]
    end
  end

  def col_match?(x, y, z)
    board[x] == board[y] && board[y] == board[z]
  end


end
