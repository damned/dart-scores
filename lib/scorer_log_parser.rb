require_relative 'scores'

class ScorerLogParser
  require 'time'
  def parse_from_csv(csvlines)
    scores = Scores.new 
    csvlines.each { |line|
      score_s, time_s = line.split ','
      scores.add(score_s.to_i, Time.parse(time_s)) unless score_s.empty?
    }
    scores
  end
end

