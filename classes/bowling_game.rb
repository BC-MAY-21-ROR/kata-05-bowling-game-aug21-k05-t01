# frozen_string_literal: true

require_relative './board'

# Clase Juego que aplica todos los metodos a las demas clases
class BowlingGame
  def initialize
    @board_father = Board.new
    @board_child = @board_father.board
    display_points
    init_game
  end

  def init_game
    @board_child.each_with_index do |frame, index|
      next unless index < 10

      ask_for_shoot(frame, index)
      ask_for_extra_shoot(frame, index) if index == 9 && @board_father.extra1 == 1
      display_points
    end
  end

  def ask_for_shoot(frame, index)
    frame.each_with_index do |_shoot, key_index|
      next unless key_index < 2 && frame[:first_shoot] != 10

      print "\nPress any key for shoot\n"
      frame[frame.keys[key_index]] = gets.chomp.to_i
    end
    @board_father.add_frame(frame, index)
  end

  def ask_for_extra_shoot(frame, index)
    if @board_child[index][:first_shoot] == 10
      before_extra_shot_strike(frame, index)
    else
      display_you_have_extra
      frame[:third_shoot] = gets.chomp.to_i
      @board_child[index + 1][:first_shoot] = frame[:third_shoot]
    end
    @board_father.add_frame(frame, index)
  end

  def before_extra_shot_strike(frame, index)
    frame.each_with_index do |_count, key_index|
      next if (key_index == 3) || key_index.zero?

      display_you_have_extra
      frame[frame.keys[key_index]] = gets.chomp.to_i
      second_extra_shot_conditions(frame, index, key_index)
    end
  end

  def second_extra_shot_conditions(frame, index, key_index)
    searcher = key_index + index
    if searcher == 10
      @board_child[searcher][:first_shoot] = frame[frame.keys[key_index]]
    elsif (@board_child[index + 1][:first_shoot] < 10) && (searcher == 11)
      @board_child[index + 1][:second_shoot] = frame[frame.keys[key_index]]
    else
      @board_child[searcher][:first_shoot] = frame[frame.keys[key_index]]
    end
  end

  def display_you_have_extra
    print "\n"
    print '¡You have a extra shoot!, Press any key for shoot!'.center(58, '=========================')
    print "\n"
  end

  def display_points
    clear_display
    print "\n"
    print 'PUNTAJES'.center(72, '================================')
    print "\n"
    @board_child.each_with_index { |frame, index| print_formated(index, frame) }
    print 'PUNTAJE TOTAL'.center(72, '================================')
    print "\n"
    print @board_father.total_score.to_s.center(70)
  end

  def print_formated(index, frame)
    if index < 9
      puts "|| Frame numero #{index + 1}  =>  Primer tiro: #{frame[:first_shoot]}" \
        " Segundo tiro: #{frame[:second_shoot]} Total: #{frame[:total_turn_score]}        || "
    elsif index == 9
      puts "|| Frame numero #{index + 1} =>  Primer tiro: #{frame[:first_shoot]}" \
      " Segundo tiro: #{frame[:second_shoot]} Tercer tiro: #{frame[:third_shoot]}  || "
    end
  end

  def clear_display
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end
end

BowlingGame.new
