class ScoreChart
  def initialize(buckets)
    @buckets = buckets
  end

  def render(width: 3, with_empties: false)
    lines = []

    remaining = @buckets.dup
    strip_empties(remaining) unless with_empties

    keys = remaining.keys
    
    lines << keyline(keys, width)

    while remaining.values.inject(:+) > 0 do
      lines << remaining.map {|k, v| 
        line_v = [v, width].min
        remaining[k] = v - line_v
        line = ('O' * line_v).ljust(width, ' ')
        line.reverse! if to_the_right?(k)
        line
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

  def strip_empties(buckets)
    strip_leading_empties buckets, buckets.keys
    strip_leading_empties buckets, buckets.keys.reverse
  end

  def strip_leading_empties(buckets, keys)
    keys.each {|k|
      break unless buckets[k] == 0
      buckets.delete k
    }
  end

  def to_the_right?(key)
    keys = @buckets.keys
    key_index = keys.index(key)
    to_left = (key_index > 0) ? @buckets[keys[key_index - 1]] : 0
    to_right = (key_index < keys.size - 1) ? @buckets[keys[key_index + 1]] : 0
    to_right >= to_left
  end
end
