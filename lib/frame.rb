# generic Frame class
class Frame
  def initialize(pins, hitIndex)
    @pins = pins
    @hitIndex = hitIndex
  end
 
  def score
    @pins[@hitIndex] + @pins[@hitIndex+1]
  end
 
  def self.match?(pins, hitIndex)
    true
  end
 
  def size
    2
  end
end
# Spare class when the sum of throws == 10 
class Spare < Frame
  def score
    10 + @pins[@hitIndex+2]
  end
 
  def self.match?(pins, hitIndex)
    pins[hitIndex] + pins[hitIndex+1] == 10
  end
end

# Strike class when the first throws == 10 
class Strike < Frame
  def score
    10 + @pins[@hitIndex+1] + @pins[@hitIndex+2]
  end
 
  def self.match?(pins, hitIndex)
    pins[hitIndex] == 10
  end
 
  def size
    1
  end
end