class ScoreChart
  def initialize(buckets)
    @buckets = buckets
  end

  def render(width: 3)
    lines = []
    remaining = @buckets.dup
    keys = @buckets.keys
    
    lines << keyline(keys, width)

    while remaining.values.inject(:+) > 0 do
      lines << remaining.map {|k, v| 
        line_v = [v, width].min
        remaining[k] = v - line_v
        ('O' * line_v).rjust(width, ' ')
      }.join('')
    end
    lines.reverse.join("\n")
  end

  private

  def keyline(keys, width)
    keys.map {|key|
      key.first.to_s.ljust(width, ' ')
    }.join ''
  end

end
