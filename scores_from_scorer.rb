require_relative 'lib/scores'
require_relative 'lib/scorer_log_parser'
require_relative 'show_average'

log = File.readlines 'from-scorer/scores.txt'
scores = ScorerLogParser.new.parse log
show_average(scores.date_s, scores.buckets)

