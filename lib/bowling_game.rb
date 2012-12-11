# Bowling game score calculation
class BowlingGame
  attr_accessor :name
  
  def initialize(name, *frame_types)
    @name = name
    @pins = []
    @frameTypes = frame_types
  end
 
  def pins(value)
    @pins = value[0].is_a?(Array) ? value.flatten : value
  end
 
  def score
    score_sheet.last
  end

  def score_sheet
    create_frames.inject([]) {|total, frame| total << (total.last || 0) + frame.score}
  end
 
  def create_frames
    hitIndex = 0
    frames = []
    10.times do
      frames << next_frame(hitIndex)
      hitIndex += frames.last.size
    end
    frames
  end
 
  def next_frame(hitIndex)
    for rule in @frameTypes
      return rule.new(@pins, hitIndex) if rule.match?(@pins, hitIndex)
    end
  end
 
end