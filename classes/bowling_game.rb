# frozen_string_literal: true

require_relative './board'

#Clase Juego que aplica todos los metodos a las demas clases
class BowlingGame
  def initalize
    @board_father = Board.new
  end

  def display_points
    print '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  end

  def clear_display
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end
  end
end
