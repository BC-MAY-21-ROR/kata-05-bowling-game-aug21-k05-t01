# frozen_string_literal: true

# Clase shoot para definir las reglas de puntaje
class Shoot
  def self.get_type(frame)
    return :strike if strike?(frame)
    return :spare if spare?(frame)
    return :normal if normal?(frame)
  end

  def self.strike?(frame)
    (frame[:first_shoot] == 10)
  end

  def self.spare?(frame)
    (frame[:first_shoot] + frame[:second_shoot] == 10) and (frame[:first_shoot] < 10)
  end

  def self.normal?(frame)
    frame[:first_shoot] + frame[:second_shoot] < 10
  end
end
