def show_average(date, buckets)
  total = 0
  count = 0
  buckets.each do |score, tally|
    range = score.is_a?(Range) ? score : score..score
    lower, upper = range.first, range.last
    bucket_middle = (lower + upper) / 2
    if tally.is_a? Array 
      blocks, singles = tally
      bucket_count = (blocks * 9) + singles
    else
      bucket_count = tally
    end
    count += bucket_count
    total += bucket_count * bucket_middle
  end

  average = total.to_f / count

  puts "#{date}: average #{average.round(1)} of #{count} scores"
end
