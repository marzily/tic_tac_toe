class Check1DBoard
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def message
    player = winner

    if player == "O"
      "The winner is O"
    elsif player == "X"
      "The winner is X"
    else
      "There is no winner"
    end
  end

  private

    def winner
      find_by_row || find_by_col || find_by_diag
    end

    def find_by_row
      if row_match?(0, 2)
        board[0]
      elsif row_match?(3, 5)
        board[3]
      elsif row_match?(6, 8)
        board[6]
      end
    end

    def row_match?(x, y)
      board[x..y].all? {|space| space == "O" } ||
      board[x..y].all? {|space| space == "X" }
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
      if board[x] && board[y] && board[z]
        board[x] == board[y] && board[y] == board[z]
      end
    end

    def find_by_diag
      if top_bottom_diag?
        board[0]
      elsif bottom_top_diag?
        board[2]
      end
    end

    def top_bottom_diag?
      board[0] == board[4] && board[4] == board[8]
    end

    def bottom_top_diag?
      board[2] == board[4] && board[4] == board[6]
    end
end
