class DeepThought
  def initialize(printer)
    @printer = printer
  end

  def print_the_answer
    @printer.print("42")
  end
end

describe DeepThought do
  it "prints the answer to the ultimate question" do
    printer = double("printer")
    computer = DeepThought.new(printer)

    expect(printer).to receive(:print).with("42")

    computer.print_the_answer
  end
end
