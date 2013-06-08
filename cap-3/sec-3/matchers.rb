describe "Be matchers", "when actual is `true`" do
  subject { true }

  it { should be_true }
  it { should_not be_false}
  it { should_not be_nil }
  it { should be }
end

describe "Equality matchers" do
  let(:a) { "a" }

  it "has equal, eql, be and eq matchers" do
    expect(a).to equal(a)
    expect(a).not_to equal("a")

    expect(a).to be(a)
    expect(a).not_to be("a")

    expect(a).to eql("a")
    expect(a).not_to eql("b")

    expect(a).to eq(a)
    expect(a).to eq("a")
    expect(a).not_to eq("b")
  end
end

describe "Array related matchers" do
  subject(:array) { [1, 2, 3, 4] }

  it "has a MatchArray matcher" do
    expect(array).to match_array([4, 3, 2, 1])
    expect(array).to match_array([1, 2, 3, 4])

    expect(array).not_to match_array([1, 2, 3])
    expect(array).not_to match_array([1, 2, 3, 4, 5])
  end

  it "has an Include matcher" do
    expect(array).to include(1)
    expect(array).to include(1, 2, 3)
    expect(array).to include(1, 2, 3, 4)

    expect(array).not_to include(0)
    expect(array).not_to include(5)
    expect(array).not_to include(5, 6, 7, 8)
    expect(array).not_to include([1, 2, 3, 4])
  end

  it "has a StartAndEndWith matcher" do
    expect(array).to start_with(1)
    expect(array).to start_with(1, 2)
    expect(array).not_to start_with(2)

    expect(array).to end_with(4)
    expect(array).to end_with(3, 4)
    expect(array).not_to end_with(3)
  end
end

describe "Hash related matchers" do
  subject(:hash) { { a: 7, b: 5 } }

  it "has an Include matcher" do
    expect(hash).to include(:a)
    expect(hash).to include(:a, :b)
    expect(hash).to include(a: 7)
    expect(hash).to include(b: 5, a: 7)

    expect(hash).not_to include(:c)
    expect(hash).not_to include(a: 11)
    expect(hash).not_to include(a: 13, c: 11)
    expect(hash).not_to include(:c, :d)
  end
end

describe "String related matchers" do
  subject(:string) { "hugo barauna" }

  it "has a Match matcher" do
    expect(string).to match(/hugo/)
    expect(string).to match(/araun/)

    expect(string).not_to match(/barao/)
    expect(string).not_to match(/hugs/)
  end

  it "has an Include matcher" do
    expect(string).to include("h")
    expect(string).to include("hugo")
    expect(string).to include("hugo", "bara")

    expect(string).not_to include("barao")
    expect(string).not_to include("hugs")
  end

  it "has a StartAndEndWith matcher" do
    expect(string).to start_with("hugo")
    expect(string).not_to start_with("barauna")

    expect(string).to end_with("barauna")
    expect(string).not_to end_with("hugo")
  end
end

describe "Predicate matchers", "for an old ball" do
  subject(:cart) do
    double("cart",
      old?: true,
      has_products?: true,
      thing?: true,
      object?: true
    )
  end

  it 'generates a be_old matcher from a old? method' do
    expect(cart).to be_old
  end

  it 'generates a have_products matcher from a has_products? method' do
    expect(cart).to have_products
  end

  it 'generates a be_a_thing from an thing? method' do
    expect(cart).to be_a_thing
  end

  it 'generates a be_an_object from an object? method' do
    expect(cart).to be_an_object
  end
end

describe 'RaiseError matcher' do
  it 'works for every exception' do
    expect { raise }.to raise_error
    expect { raise }.to raise_exception

    expect do
      raise
    end.to raise_error
  end

  it 'works matching the exception class' do
    expect { raise RuntimeError }.to raise_error(RuntimeError)
    expect { raise StandarError }.to_not raise_error(RuntimeError)
  end

  it 'works matching the exception message' do
    expect { raise 'ZOMG' }.to raise_error('ZOMG')
  end
end

describe "Number related matchers" do
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

  it "has a BeWithin matcher"
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
