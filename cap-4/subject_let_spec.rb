describe Array, "with some elements" do
  subject(:array) { [1,2,3] }

  it "should have the prescribed elements" do
    array.should == [1,2,3]
  end
end

describe Array, "with some elements" do
  before do
    @array =  [1,2,3]
  end

  it "should have the prescribed elements" do
    @array.should == [1,2,3]
  end
end

TwitterUi = Struct.new(:username, :password) do
  def initialize(username, password)
    @messages = []
    super
  end

  def read
    @messages.join("\n")
  end

  def write(message)
    @messages << message
  end
end

class Game
  attr_accessor :ui

  def initialize(ui = nil)
    @ui = ui
  end

  def player_hits_target
    congratulate_player
  end

  def output
    @ui.read
  end

  private

  def congratulate_player
    @ui.write("Congratulations!")
  end
end

describe Game do
  before do
    @game = Game.new
  end

  let(:ui) { TwitterUi.new('sandbox_username', 'sandbox_password') }

  it "congratulates the player when the player hits the target" do
    @game.ui = ui

    @game.player_hits_target

    expect(@game.output).to include("Congratulations!")
  end
end

describe Game do
  subject(:game) { Game.new(ui) }
  let(:ui) { TwitterUi.new('sandbox_username', 'sandbox_password') }

  it "congratulates the player when the player hits the target" do
    game.player_hits_target

    expect(game.output).to include("Congratulations!")
  end
end

describe "The lazy-evaluated behavior of let" do
  before { @foo = 'bar' }

  let(:broken_operation) { raise "I'm broken" }

  it "will call the method defined by let" do
    expect {
      expect(@foo).to eq('bar')
      broken_operation
    }.to raise_error("I'm broken")
  end

  it "won't call the method defined by let" do
    expect {
      expect(@foo).to eq('bar')
    }.not_to raise_error
  end
end
