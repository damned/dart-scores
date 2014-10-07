def show_average(date, buckets)
  total = 0
  count = 0
  buckets.each do |range, block_and_singles|
    lower, upper = range.first, range.last
    bucket_middle = (lower + upper) / 2
    blocks, singles = block_and_singles
    bucket_count = blocks * 9 + singles
    count += bucket_count
    total += bucket_count * bucket_middle
  end

  average = total.to_f / count

  puts "#{date}: average #{average.round(2)} of #{count} scores"
end
