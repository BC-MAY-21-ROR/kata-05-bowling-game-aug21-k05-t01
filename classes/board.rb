# frozen_string_literal: true

require_relative './shoot'

# Class Board
class Board
  attr_reader :board

  def initialize
    @board = []
    @total_score = 0
    init_board
  end

  def init_board
    10.times do
      @board << { first_shoot: 0, second_shoot: 0, total_turn_score: 0 }
    end
  end

  def calculate_strike(index)
    score = @board[index - 1][:total_turn_score] + 10
    next_frame = @board[index + 1]
    total_score = calculate_total_turn_score(next_frame, score, index)
    @board[index][:total_turn_score] = total_score
  end

  def calculate_spare(index)
    next_value = @board[index + 1][:first_shoot] unless @board[index + 1].nil?
    @board[index][:total_turn_score] = @board[index - 1][:total_turn_score] + 10 + next_value.to_i
  end

  def calculate_normal(index)
    frame = @board[index]
    score = @board[index - 1].nil? ? 0 : @board[index - 1][:total_turn_score]
    @board[index][:total_turn_score] = score + (frame[:first_shoot] + frame[:second_shoot])
  end

  def calculate_total_turn_score(frame, index_ctts, given_score)
    if Shoot.get_type(frame) == :strike
      given_score + (frame[:first_shoot] + @board[index_ctts + 2][:first_shoot])
    else
      given_score + (frame[:first_shoot] + frame[:second_shoot])
    end
  end
end
