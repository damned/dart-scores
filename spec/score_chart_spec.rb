require_relative '../lib/score_chart'

describe ScoreChart do
  it 'should render scores from a bucket' do
    scores = {
      0..1 => 1,
    }
    chart = ScoreChart.new scores

    expect(chart.render(width: 2)).to eq chart(' O',
                                               '0 ')
  end

  it 'should render scores from multiple buckets' do
    scores = {
      0..1 => 2,
      2..3 => 1
    }
    chart = ScoreChart.new scores

    expect(chart.render(width: 2)).to eq chart('OO O',
                                               '0 2 ')
  end

  it 'should render scores from buckets on multiple lines' do
    scores = {
      0..1 => 3,
      2..3 => 1
    }
    chart = ScoreChart.new scores

    expect(chart.render(width: 2)).to eq chart(' O  ',
                                               'OO O',
                                               '0 2 ')
  end

  it 'should render scores for bigger bucket widths' do
    chart = ScoreChart.new(0..1 => 3,
                           2..3 => 5)

    expect(chart.render(width: 4)).to eq chart('       O',
                                               ' OOOOOOO',
                                               '0   2   ')
  end

  it 'should optionally render empty buckets' do
    chart = ScoreChart.new(0..1 => 0, 2..3 => 3)

    expect(chart.render(with_empties: true)).to eq chart('   OOO',
                                                         '0  2  ')
  end
        
  it 'should ignore leading and trailing empty buckets' do
    chart = ScoreChart.new(0..1 => 0, 2..3 => 3, 4..5 => 0)

    expect(chart.render).to eq chart('OOO',
                                     '2  ')
  end

  it 'should render embedded empty buckets' do
    chart = ScoreChart.new(0..1 => 3, 2..3 => 0, 4..5 => 3, 6..7 => 0)

    expect(chart.render).to eq chart('OOO   OOO',
                                     '0  2  4  ')
  end

  def chart(*lines)
    lines.join("\n")
  end
end

