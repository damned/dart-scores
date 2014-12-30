require_relative 'scores'

class ScorerLogParser
  require 'time'
  def parse(csvlines)
    scores = Scores.new 
    csvlines.each { |line|
      score_s, time_s = line.split ','
      scores.add(score_s.to_i, Time.parse(time_s)) unless score_s.empty?
    }
    scores
  end
end

