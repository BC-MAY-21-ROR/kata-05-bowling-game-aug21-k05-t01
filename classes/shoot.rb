# strike tiró todos los pines en un intento 
# spare tiró los pines pero utilizó los dos intentos
# Hacer un spare es tirar los diez en dos tiros
# open o normal que no tiró todos los pines
# frame es turno, no es tiro
# miss

class Shoot
  def self.get_type(frame)
    return type = :strike if self.is_strike?(frame)
    return type = :spare if self.is_spare?(frame)
    return type = :normal if self.is_normal?(frame)
  end

  def self.is_strike?(frame)
    return true if frame[:first_shoot] == 10
  end

  def self.is_spare? (frame)
    return true if (frame[:first_shoot] + frame[:second_shoot] == 10) and (frame[:first_shoot] < 10)
  end

  def self.is_normal?(frame)
    return true if frame[:first_shoot] + frame[:second_shoot] < 10
  end
end

