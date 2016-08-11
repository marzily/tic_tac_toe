gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './check_board'
gem 'byebug'

class CheckBoardTest < Minitest::Test

  def setup
    board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
    @check = CheckBoard.new(board)
  end
  
  def test_it_has_a_board
    assert @check.board.is_a?(Array)
  end

  def test_it_returns_proper_msg_if_no_winner
    assert_equal "There is no winner", @check.check_winner
  end

  def test_it_returns_proper_msg_if_row_winner
    @check.board[2] = ["X", "X", "X"]

    assert_equal "X is the winner", @check.check_winner
  end

  def test_it_returns_proper_msg_if_col_winner
    @check.board.each { |row| row[1] = "O" }

    assert_equal "O is the winner", @check.check_winner
  end

  def test_it_returns_proper_msg_if_diag_winner
    @check.board.each_with_index do |row, i|
      row[i] = "X"
    end

    assert_equal "X is the winner", @check.check_winner
  end

  def test_it_returns_proper_msg_if_other_diag_winner
    i = @check.board.length - 1
    @check.board.each do |row|
      row[i] = "O"
      i -= 1
    end

    assert_equal "O is the winner", @check.check_winner
  end

  def test_it_returns_proper_msg_if_board_full
    @check.board = [
      ["X", "X", "O"],
      ["O", "O", "X"],
      ["X", "O", "X"]
    ]

    assert_equal "There is no winner", @check.check_winner
  end

end
