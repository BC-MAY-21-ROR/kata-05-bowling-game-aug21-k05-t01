# frozen_string_literal: true

require_relative './board'

# Clase Juego que aplica todos los metodos a las demas clases
class BowlingGame
  def initialize
    @board_father = Board.new
    @board_child = @board_father.board
    display_points
  end

  def display_points
    clear_display
    print "\n"
    print 'PUNTAJES'.center(58, '=========================')
    print "\n"
    @board_child.each_with_index { |frame, index| print_formated(index, frame) }
    print 'PUNTAJE TOTAL'.center(58, '=========================')
  end

  def print_formated(index, frame)
    if index + 1 < 10
      puts "|| Frame number #{index + 1}  =>  shoot one: #{frame[:first_shoot]}" \
        " shoot two #{frame[:second_shoot]} total: #{frame[:total_turn_score]} || "
    elsif index + 1 == 10
      puts "|| Frame number #{index + 1} =>  shoot one: #{frame[:first_shoot]}" \
      " shoot two #{frame[:second_shoot]} total: #{frame[:total_turn_score]} || "
    end
  end

  def clear_display
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end
end

BowlingGame.new
