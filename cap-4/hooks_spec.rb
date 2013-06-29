class Game
  attr_accessor :phase
  attr_reader :output, :score, :mails_sent

  def initialize
    @phase = :initial
    @output = ''
    @score = 0
    @mails_sent = false
  end

  def player_hits_target
    if @phase == :final
      congratulate_player
      @score = 100
      send_emails_to_player_friends
    end
  end

  private

  def congratulate_player
    @output = "Congratuations!"
  end

  def send_emails_to_player_friends
    @mails_sent = true
  end
end

describe Game, "in the final phase" do
  before do
    @game = Game.new
    @game.phase = :final
  end

  context "when the player hits the target" do
    it "congratulates the player" do
      @game.player_hits_target

      expect(@game.output).to eq("Congratuations!")
    end

    it "sets the score to 100" do
      @game.player_hits_target

      expect(@game.score).to eq(100)
    end
  end
end

describe "Around hook examples" do
  context "simple example" do
    around do |example|
      puts "Before the example"
      example.run
      puts "After the example"
    end

    it do
      puts "Inside the example"
    end
  end

  context "database transaction example" do
    class Database
      def self.transaction
        puts "open transaction"
        yield
        puts "rollback transaction"
      end
    end

    describe "around hook" do
      around(:each) do |example|
        Database.transaction(&example)
      end

      it "runs the example as a proc" do
        puts "saving a lot of data in the database"
      end
    end
  end
end
