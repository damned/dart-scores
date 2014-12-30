require_relative 'score_history'
require_relative 'show_average'
require_relative 'lib/scorer_log_parser'

logged_scores = ScorerLogParser.new.parse File.readlines('from-scorer/scores.txt')

scores = ScoreHistory.buckets_by_date
scores[logged_scores.date_s] = logged_scores.buckets

scores.each do |date, buckets|
  show_average(date.to_s, buckets)
end

