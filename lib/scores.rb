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

