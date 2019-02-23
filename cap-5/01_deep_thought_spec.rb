class DeepThought
  def print_the_answer
    puts "42"
  end
end

RSpec.describe DeepThought do
  it "prints the answer to the ultimate question" do
    computer = DeepThought.new

    computer.print_the_answer

    expect(STDOUT.read).to include("42")
  end
end
