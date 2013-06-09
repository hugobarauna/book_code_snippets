class Game
  attr_reader :state

  def initialize
    @state = :initial
  end

  def start
    @state = :started
  end
end

describe Game do
  describe "#start" do
    it 'changes the game state from :initial to :started' do
      game = Game.new

      expect {
        game.start
      }.to change { game.state }.from(:initial).to(:started)
    end
  end
end
