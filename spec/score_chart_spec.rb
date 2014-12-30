require_relative '../lib/score_chart'

describe ScoreChart do
  it 'should render scores from a bucket' do
    scores = {
      0..1 => 1,
    }
    chart = ScoreChart.new scores

    expect(chart.render(bucket_width: 2)).to eq chart(' O',
                                                      '0 ')
  end

  xit 'should render scores from multiple buckets' do
    scores = {
      0..1 => 2,
      2..3 => 1
    }
    chart = ScoreChart.new scores

    expect(chart.render(bucket_width: 2)).to eq chart('OO O',
                                                      '0 2 ')
  end

  xit 'should render scores from buckets on multiple lines' do
    scores = {
      0..1 => 3,
      2..3 => 1
    }
    chart = ScoreChart.new scores

    expect(chart.render(bucket_width: 2)).to eq chart(' O  ',
                                                      'OO O',
                                                      '0 2 ')
  end

  def chart(*lines)
    lines.join("\n")
  end
end

