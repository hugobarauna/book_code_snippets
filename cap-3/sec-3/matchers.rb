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
    expect(array).to include(*[1, 2, 3, 4])

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
    expect { raise 'error message' }.to raise_error('error message')
    expect { raise 'wrong message' }.to_not raise_error('error message')
  end
end

describe 'BeWithin matcher' do
  it 'should be used for floating point value verifications' do
    expect {
      expect(Math::PI).to eq(3.14)
    }.to raise_error(RSpec::Expectations::ExpectationNotMetError)

    expect(Math::PI).to be_within(0.01).of(3.14)
  end

  it 'uses the (expected - delta) <= actual <= (expected - delta) expression' do
    expect(4.5).to be_within(0.5).of(5)
    expect(5.0).to be_within(0.5).of(5)
    expect(5.5).to be_within(0.5).of(5)

    expect(4.49).to_not be_within(0.5).of(5)
    expect(5.51).to_not be_within(0.5).of(5)
  end
end

describe 'Cover matcher' do
  it 'can be used to verify the membership relation with ranges' do
    expect((1..10)).to cover(1)
    expect((1..10)).to cover(10)
    expect((1..10)).to cover(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    expect((1..10)).to cover(5, 6, 7, 8)
  end
end

describe "BeComparedTo matcher (number comparison matcher)" do
  it 'works more or less like operator matchers' do
    expect(7).to be == 7
    expect(7).to be < 10
    expect(7).to be > 1
    expect(7).to be <= 7
    expect(7).to be >= 7
    expect(7).to be ===  7
  end
end

describe 'Matchers for verifying the class of an object' do
  describe 'BeInstanceOf' do
    it 'verifies if an object is an instance of the given class' do
      expect(5).to be_an_instance_of(Fixnum)
      expect(5).not_to be_an_instance_of(Numeric)

      expect(5).not_to be_an_instance_of(String)
    end
  end

  describe 'BeAKindOf' do
    it 'verifies if an object is an instance of a subclass of the given class' do
      expect(5).to be_a_kind_of(Fixnum)
      expect(5).to be_a_kind_of(Numeric)
      expect(5).to be_a_kind_of(Object)

      expect(5).not_to be_a_kind_of(String)
    end
  end
end

describe 'Have Matcher' do
  context 'when actual owns a collection returned by actual#method_name' do
    let(:klass) do
      class BagOfWords
        attr_reader :words

        def initialize
          @words = []
        end

        def put(*words)
          @words += words
        end
      end

      BagOfWords
    end

    it 'works when calling sending Have#method_name' do
      actual = klass.new
      actual.put(1, 2)

      expect(actual).to have(2).words
    end
  end

  context 'when actual is a collection' do
    it 'works by calling any method with Have#method' do
      collection = [1, 2, 3]

      expect(collection).to have(3).items
      expect(collection).to have(3).children
      expect(collection).to have(3).things
    end

    it 'works even when the collection is a string' do
      words = "hugo"

      expect(words).to have(4).letters
      expect(words).to have(4).items
    end
  end

  it 'has a have_at_least and have_at_most matchers' do
    collection = [1, 2, 3, 4, 5]

    expect(collection).to have_at_least(3).elements
    expect(collection).to have_at_most(5).elements
  end
end

describe 'A use case for the change matcher' do
  let(:klass) do
    class Game
      attr_reader :state

      def initialize
        @state = :initial
      end

      def start
        @state = :started
      end
    end

    Game
  end

  it 'works by passing a block to the change method' do
    game = klass.new

    expect {
      game.start
    }.to change{ game.state }.from(:initial).to(:started)
  end

  it 'works by passing a receiver and a message name' do
    game = klass.new

    expect {
      game.start
    }.to change(game, :state).from(:initial).to(:started)
  end
end
