class ScoreChart
  def initialize(buckets)
    @buckets = buckets
  end

  def render(bucket_width: 3)
    chart = []
    chart << values.map {|v| ('O' * v).ljust(bucket_width, ' ').reverse }.join('')
    chart << keys.map(&:first).join(' ').ljust(bucket_width, ' ')
    chart.join("\n")
  end

  private

  attr_reader :buckets
  def keys
    buckets.keys
  end
  def values
    buckets.values
  end
end
