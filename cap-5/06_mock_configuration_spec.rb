class Money; end

RSpec.describe "Some ways that I can configure my mock" do
  it "can be configurable to raise an exception" do
    bomb = double("bomb")
    expect(bomb).to receive(:explode!).and_raise(RuntimeError)

    expect {
      bomb.explode!
    }.to raise_error(RuntimeError)
  end

  it "can restrict arguments" do
    obj = Object.new
    def obj.message(*); end

    expect(obj)
      .to receive(:message)
      .with("more_than", "one_argument")
    expect(obj).to receive(:message).with(anything())
    expect(obj).to receive(:message).with(an_instance_of(Money))
    expect(obj).to receive(:message).with(hash_including(:a => "b"))

    obj.message("more_than", "one_argument")
    obj.message(42)
    obj.message(Money.new)
    obj.message(a: "b", c: "d")
  end

  context "method call count" do
    subject(:obj) do
      obj = Object.new
      def obj.message(*); end
      obj
    end

    it do
      expect(obj).to receive(:message).once

      obj.message
    end

    it do
      expect(obj).to receive(:message).twice

      2.times { obj.message }
    end

    it do
      expect(obj).to receive(:message).exactly(3).times

      3.times { obj.message }
    end

    it do
      expect(obj).to receive(:message).at_least(:once)

      obj.message
    end

    it do
      expect(obj).to receive(:message).at_least(:twice)

      2.times { obj.message }
    end

    it do
      n = 1
      expect(obj).to receive(:message).at_least(n).times

      10.times { obj.message }
    end

    it do
      expect(obj).to receive(:message).at_most(:once)

      obj.message
    end

    it do
      expect(obj).to receive(:message).at_most(:twice)

      2.times { obj.message }
    end

    it do
      n = 10
      expect(obj).to receive(:message).at_most(n).times

      10.times { obj.message }
    end
  end

  it "can be configurable to return a value" do
    bomb = double("bomb")
    expect(bomb).to receive(:status).and_return("turned off")

    expect(bomb.status).to eq("turned off")
  end
end
