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
  attr_reader :buckets, :time
  def initialize
    @buckets = init_buckets
    @time = Time.now
  end
  def add(score, time)
    buckets.each do |bucket, tally|
      if bucket.include? score
        buckets[bucket] = tally + 1
      end
    end
    @time = time if time < @time
  end
  def to_s
    buckets.to_s
  end

  private

  def init_buckets(size = 5, count = 20)
    starts = (0..(count-1)).map {|i| i * 5}
    ranges = starts.map {|start| start..(start + size - 1) }
    buckets = {}
    ranges.each {|range| buckets[range] = 0 }
    buckets
  end
end

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

require_relative 'show_average'

log = File.readlines 'from-scorer/scores.txt'
scores = ScorerLogParser.new.parse_from_csv log
show_average(scores.time.to_s, scores.buckets)

