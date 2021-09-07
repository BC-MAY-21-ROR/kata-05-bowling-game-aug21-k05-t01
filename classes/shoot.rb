# strike tiró todos los pines en un intento 
# spare tiró los pines pero utilizó los dos intentos
# Hacer un spare es tirar los diez en dos tiros
# open o normal que no tiró todos los pines
# frame es turno, no es tiro
# miss

class Shoot
  def get_type(frame)
      print "Strike\n" if self.is_strike?(frame)
      print "Spare\n" if self.is_spare?(frame)
      print "Normal\n" if self.is_normal?(frame)
  end
  def is_strike?(frame)
      return true if frame[:first_shoot] == 10 
      
  end
  def is_spare? (frame)
      return true if (frame[:first_shoot] + frame[:second_shoot] == 10) and (frame[:first_shoot] < 10)
  end
  def is_normal?(frame)
      return true if frame[:first_shoot] + frame[:second_shoot] < 10
  end
end

