{
  25..29 => 1,
  30..34 => 4,
  35..39 => [3, 0],
  40..44 => [7, 8],
  45..49 => [13, 0],
  50..54 => [9, 3],
  55..59 => [5, 3],
  60..64 => [1, 1]
}

class Scores
  attr_reader :buckets, :date
  def initialize
    @buckets = { 50..54 => 7 }
    @date = Time.now
  end
end

class ScorerLogParser
  def parse_from_csv(csv)
    scores = Scores.new 
    scores
  end
end

require_relative 'show_average'

scores = ScorerLogParser.new.parse_from_csv('')
show_average(scores.date.to_s, scores.buckets)

