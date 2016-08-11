class CheckBoard
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def check_winner
    winner = check_rows || check_cols || check_diag || check_other_diag

    if winner
      return "#{winner} is the winner"
    else
      return "There is no winner"
    end
  end

private

    def check_rows
      board.each do |row|
        if spaces_match?(row)
          return row[0]
        end
      end
      nil
    end

    def check_cols
      i = 0
      while i < board.count
        column = iterate_over_col(i)

        if spaces_match?(column)
          return column.first
        end

        i += 1
      end
    end

    def spaces_match?(section)
      # bug here for test at line 56
      section.all? {|space| space == "X" || space == "O"}
    end

    def iterate_over_col(i)
      column = []
      j = 0
      while j < board.count
        column << board[j][i]
        j += 1
      end
      column
    end

    def check_diag
      diag = []
      board.count.times do |i|
          diag << board[i][i]
      end

      check_spaces(diag)
    end

    def check_other_diag
      diag = []
      i = -1
      board.each do |row|
        diag << row[i]
        i -= 1
      end

      check_spaces(diag)
    end

    def check_spaces(spaces)
      if spaces_match?(spaces)
        spaces.first
      end
    end

end
