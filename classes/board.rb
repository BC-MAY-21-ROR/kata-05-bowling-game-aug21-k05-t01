
require_relative './shoot.rb'

class Board
  attr_reader :board

  def initialize
    @board = []
    @total_score = 0
    init_board
  end
  
  def init_board
    (1..10).each do 
      @board << { first_shoot: 0, second_shoot: 0, total_turn_score: 0}
    end
  end
end

board1 = Board.new
print board1.board
