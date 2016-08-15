gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './check_1D_board'

class Check1DBoardTest < Minitest::Test

  def setup
    board = Array.new(9)
    @check_board = Check1DBoard.new(board)
  end

end
