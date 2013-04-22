class Stack
  def initialize
    @elements = []
  end

  def push(element)
    @elements << element
  end

  def top
    @elements[-1]
  end
end

describe Stack do
  describe "#push" do
    it "puts an element at the top of the stack" do
      stack = Stack.new

      stack.push(1)
      stack.push(2)

      stack.top.should eq(2)
    end
  end
end
