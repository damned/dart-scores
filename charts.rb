require_relative 'lib/score_chart'
require_relative 'lib/scorer_log_parser'
require_relative 'score_history'

log = File.readlines './from-scorer/scores.txt'
scores = ScorerLogParser.new.parse log
bucketses = ScoreHistory.buckets_by_date.values
bucketses << scores.buckets
bucketses.each {|buckets|
  begin
    chart = ScoreChart.new(buckets)
    puts chart.render(colored: true)
  rescue
    puts 'oops'
  end
}
