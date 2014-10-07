buckets_by_date = {
  'jul 14' => {
    25..29 => [0, 2],
    30..34 => [1, 8],
    35..39 => [5, 2],
    40..44 => [11, 2],
    45..49 => [14, 0],
    50..54 => [10, 8],
    55..59 => [5, 2],
    60..64 => [1, 3],
    65..69 => [0, 4],
  },
  'sep 14' => {
    25..29 => [0, 1],
    30..34 => [0, 2],
    35..39 => [1, 1],
    40..44 => [4, 1],
    45..49 => [6, 1],
    50..54 => [5, 2],
    55..59 => [2, 6],
    60..64 => [1, 0],
  },
}

require_relative 'show_average'

buckets_by_date.each do |date, buckets|
  show_average(date.to_s, buckets)
end
