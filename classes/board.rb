# frozen_string_literal: true

require_relative './shoot'

# Class Board
class Board
  attr_reader :board, :extra1, :extra2, :total_score

  def initialize
    @board = []
    @total_score = 0
    init_board
    @extra1 = 0
    @extra2 = 0
  end

  def init_board
    14.times do |count|
      @board << if count == 9
                  { first_shoot: 0, second_shoot: 0, third_shoot: 0, total_turn_score: 0 }
                else
                  { first_shoot: 0, second_shoot: 0, total_turn_score: 0 }
                end
    end
  end

  def add_frame(hash_frame, index)
    @board[index] = hash_frame
    calculate_scores(index)
    @total_score = @board[index][:total_turn_score]
    extra1?(hash_frame) if index == 9
    extra2?(hash_frame) if index == 10
  end

  def calculate_extra(_shoot, index)
    0.upto(index) do |index_cicle|
      get_total(index_cicle, Shoot.get_type(@board[index_cicle]))
    end
  end

  def calculate_scores(index)
    0.upto(index) do |index_cicle|
      get_total(index_cicle, Shoot.get_type(@board[index_cicle]))
    end
  end

  private

  def extra1?(frame)
    @extra1 = %i[spare strike].include?(Shoot.get_type(frame)) ? 1 : 0
  end

  def extra2?(frame)
    @extra2 = %i[strike].include?(Shoot.get_type(frame)) ? 1 : 0
  end

  def get_total(index_gt, type)
    case type
    when :strike
      calculate_strike(index_gt)
    when :spare
      calculate_spare(index_gt)
    else
      calculate_normal(index_gt)
    end
  end

  def calculate_strike(index)
    score = @board[index - 1][:total_turn_score] + 10
    next_frame = @board[index + 1]
    total_score = total_score_strike(index, next_frame, score)
    @board[index][:total_turn_score] = total_score
  end

  def total_score_strike(index, next_frame, score)
    if Shoot.get_type(next_frame) == :strike
      score + (next_frame[:first_shoot] + @board[index + 2][:first_shoot])
    else
      score + (next_frame[:first_shoot] + next_frame[:second_shoot])
    end
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
end
