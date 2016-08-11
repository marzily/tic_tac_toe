board = [
["X", nil, nil],
[nil, "X", nil],
[nil, nil, "X"]
]

def check_winner(board)
  winner = check_row(board) || check_col(board) || check_diag(board)

  if winner
    puts "#{winner} is the winner!"
  else
    puts "There is no winner :("
  end
end

def check_row(board)
    board.each do |row|
      if row == ["X", "X", "X"]
        return "X"
      elsif row == ["O", "O", "O"]
        return "O"
      end
    end

    return nil
end

def check_col(board)

  i = 0
  while i < board.count

    col = []
    j = 0
    while j < board.count
      col = spaces(board, col, i, j)
      j += 1
    end

    if col_winner(col)
      return col_winner(col)
    end

    i += 1
  end

end

def spaces(board, col, i, j)
  if board[j][i] == "X"
    col << "X"
  elsif board[j][i] == "O"
    col << "O"
  end
  col
end

def col_winner(col)
  if col == ["X", "X", "X"]
    return "X"
  elsif col == ["O", "O", "O"]
    return "O"
  end
end

def check_diag(board)
  diag = []
  i = 0
  while i < board.count
    if board[i][i]
      diag << board[i][i]
    end
    i += 1
  end

  col_winner(diag)
end

check_winner(board)
