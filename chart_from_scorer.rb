require_relative 'lib/score_chart'
require_relative 'lib/scorer_log_parser'

log = File.readlines './from-scorer/scores.txt'
scores = ScorerLogParser.new.parse log
chart = ScoreChart.new scores.buckets
puts chart.render(colored: true)
