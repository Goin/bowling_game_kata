Dir["#{File.dirname(__FILE__)}/../lib/*.rb"].each {|f| require f}
require 'rubygems'
require 'rspec'

include Sample   # => sample of input bowling throws

def result(value = [])
  @@result ||= []
  @@result << value
  value.join(", ")
end

describe BowlingGame do
  before(:each) do
    @game = BowlingGame.new("User", Strike, Spare, Frame)
  end

  # final scores hard coded in spec to make it more visible
  it "should score each frame with #{result([0, 0, 0, 0, 0, 0, 0, 0, 0, 0])} for gutter game" do
    @game.pins(TABLE[:gutter])
    @game.score.should == 0
    @game.score_sheet.should == @@result[0]
  end

  it "should score each frame with #{result([30, 60, 90, 120, 150, 180, 210, 240, 270, 300])} for perfect game" do
    @game.pins(TABLE[:perfect])
    @game.score.should == 300
    @game.score_sheet.should == @@result[1]
  end

  it "should score each frame with #{result([7, 26, 35, 39, 43, 50, 58, 74, 82, 87])} for strike, spare and open frames" do
    @game.pins(TABLE[:random])
    @game.score.should == 87
    @game.score_sheet.should == @@result[2]
  end

  it "should score each frame with #{result([4, 8, 12, 16, 20, 24, 28, 32, 36, 40])} for frames with 2 pins" do
    @game.pins(TABLE[:all_two])
    @game.score.should == 40
    @game.score_sheet.should == @@result[3]
  end

  it "should score each frame with #{result([14, 28, 42, 56, 70, 84, 98, 112, 126, 140])} for spare game" do
    @game.pins(TABLE[:spare])
    @game.score.should == 140
    @game.score_sheet.should == @@result[4]
  end

  it "should score each frame with #{result([30, 60, 90, 120, 150, 180, 210, 230, 240, 240])} for almost perfect game with 0 final frame" do
    @game.pins(TABLE[:almost_perfect])
    @game.score.should == 240
    @game.score_sheet.should == @@result[5]
  end

  it "should score each frame with #{result([30, 60, 90, 120, 150, 180, 210, 234, 254, 273])} for perfect game with spare at the end" do
    @game.pins(TABLE[:perfect_spare_end])
    @game.score.should == 273
    @game.score_sheet.should == @@result[6]
  end
end