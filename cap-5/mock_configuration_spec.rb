describe "Some ways that I can configure my mock" do
  it "can be configurable to raise an exception" do
    bomb = double("bomb")
    expect(bomb).to receive(:explode!).and_raise(RuntimeError)

    expect {
      bomb.explode!
    }.to raise_error
  end

  it "can be configurable to return a value" do
    bomb = double("bomb")
    expect(bomb).to receive(:status).and_return("turned off")

    expect(bomb.status).to eq("turned off")
  end

  it "can be configurable with argument constraints" do
    bomb = double("bomb")
    expect(bomb).to receive(:explode).with("tomorrow")

    bomb.explode("tomorrow")
  end
end
