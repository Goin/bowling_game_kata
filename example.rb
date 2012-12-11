Dir["#{File.dirname(__FILE__)}/lib/*.rb"].each {|f| require f}

include Sample
@result = ""

TABLE.keys.each do |key|
  @game = BowlingGame.new("User #{key}", Strike, Spare, Frame)
  hits = TABLE[key]
  @game.pins(hits)
  score = @game.score
  score_sheet = @game.score_sheet
  @result << "%-25s %-25s %-25s" % ["Frame", @game.name, "Score"]
  (1..10).each do |i|
    @result << "\n"
    @result << "%-25s %-25s %-25s" % [i, hits[i-1].join(" "), score_sheet[i-1]]
  end
  @result << "\n"
  @result << "Total Score: #{score}\n\n"
end
puts @result
