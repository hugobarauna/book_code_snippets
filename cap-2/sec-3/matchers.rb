describe "Be matchers", "when actual is `true`" do
  subject { true }

  it { should be_true }
  it { should_not be_false}
  it { should_not be_nil }
  it { should be }
end

describe "Predicate matchers", "for an old ball" do
  subject(:ball) do
    ball = double("ball", old?: true )
  end

  it { should be_old }
end

describe "BeComparedTo matchers", "for the `7` number" do
  subject { 7 }

  it { should be == 7 }
  it { should be < 10 }
  it { should be > 1 }
  it { should be <= 7 }
  it { should be >= 7 }
  it { should be ===  7}

  describe "=~ operator" do
    subject { "foo" }

    it { should be =~ /foo/ }
    it { should_not be =~ /bar/ }
  end
end

describe "Operator matchers", "for the `7` number" do
  subject { 7 }

  it { should == 7 }
  # http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
  # The matchers below work, "but have never been recommended"
  it { should < 10 }
  it { should > 1 }
  it { should <= 7 }
  it { should >= 7 }
  it { should ===  7}

  describe "=~ operator", "for the 'foo' string" do
    subject { "foo" }

    it { should =~ /foo/ }
    it { should_not =~ /bar/ }
  end
end
