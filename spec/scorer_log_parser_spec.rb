require_relative '../lib/scorer_log_parser'

describe ScorerLogParser do
  it 'should parse some scores' do
    log = File.readlines 'from-scorer/scores.txt'
    scores = ScorerLogParser.new.parse log    
    expect(scores.buckets.values.inject(:+)).to be > 200
    expect(scores.buckets.keys.first).to be_a Range
  end 
end
