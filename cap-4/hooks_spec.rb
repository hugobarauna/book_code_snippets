class Game
  attr_accessor :phase
  attr_reader :output, :score

  def initialize
    @phase = :initial
    @output = ""
    @score = 0
  end

  def player_hits_target
    if @phase == :final
      congratulate_player
      @score = 100
    end
  end

  private

  def congratulate_player
    @output = "Congratulations!"
  end
end

RSpec.describe Game, "in the final phase" do
  before do
    @game = Game.new
    @game.phase = :final
  end

  context "when the player hits the target" do
    it "congratulates the player" do
      @game.player_hits_target

      expect(@game.output).to eq("Congratulations!")
    end

    it "sets the score to 100" do
      @game.player_hits_target

      expect(@game.score).to eq(100)
    end
  end
end

RSpec.describe "An around hook example" do
  around do |example|
    puts "Before the example"
    example.run
    puts "After the example"
  end

  it do
    puts "Inside the example"
  end
end

RSpec.describe "An around hook example" do
  before do
    puts "Before the example"
  end

  after do
    puts "After the example"
  end

  it do
    puts "Inside the example"
  end
end

class Database
  def self.transaction
    puts "open transaction"
    yield
    puts "rollback transaction"
  end
end

RSpec.describe "around hook" do
  around(:each) do |example|
    Database.transaction(&example)
  end

  it "runs the example as a proc" do
    puts "saving a lot of data in the database"
  end
end
