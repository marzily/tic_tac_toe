gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './check_1D_board'

class Check1DBoardTest < Minitest::Test

  def setup
    board = Array.new(9)
    @check_board = Check1DBoard.new(board)
  end

  def test_it_has_a_board
    assert_equal Array, @check_board.board.class
  end

  def test_it_checks_if_there_is_a_winner_by_row_for_O
    @check_board.board[0..2] = "O", "O", "O"

    assert_equal "The winner is O", @check_board.message
  end

  def test_it_checks_if_there_is_a_winner_by_row_for_X
    @check_board.board[3..5] = "X", "X", "X"

    assert_equal "The winner is X", @check_board.message
  end

  def test_it_finds_winner_by_column_O
    i = 0
    while i < @check_board.board.count
      @check_board.board[i] = "O"
      i += 3
    end

    assert_equal "The winner is O", @check_board.message
  end

end
