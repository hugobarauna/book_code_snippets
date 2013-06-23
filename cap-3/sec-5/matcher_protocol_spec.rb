class SimplestMatcher
  def matches?(actual)
    true
  end
end

describe 'The matcher procotol' do
  context 'a minimal matcher' do
    it 'has a #matches?(actual) method' do
      expect('anything').to SimplestMatcher.new
    end
  end

  it 'can be satisfied with a minimal matcher returned by a helper method' do
    expect('anything').to simplest_matcher
  end

  def simplest_matcher
    SimplestMatcher.new
  end
end

describe do
  it do
    actual   = 'got it'
    expected = 'got it'

    expect(actual).to eq(expected)
  end
end
