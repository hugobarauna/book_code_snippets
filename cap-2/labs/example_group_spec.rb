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

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.filter_run_excluding :skip
end

example_group_father = nil
example_group_child = nil
example = nil

example_group_father = describe Stack, :skip do
  example_group_child = describe "#push" do
    example = it "puts an element at the top of the stack" do
      stack = Stack.new

      stack.push(1)
      stack.push(2)

      stack.top.should == 2
    end
  end
end


describe "A specific example group" do
  subject { example_group_father }

  it "is named after its parent" do
    expect(subject.to_s).to eq("RSpec::Core::ExampleGroup::Nested_1")
  end

  it "it's a subclass of RSpec::Core::ExampleGroup" do
    subject.ancestors.should include(RSpec::Core::ExampleGroup)
  end

  it "does have 1 child example group" do
    subject.children.should have(1).child
  end

  it "does not have any example" do
    subject.should have(0).examples
  end

  its(:class) { should eq(Class) }
end

describe "A specific nested example group" do
  subject { example_group_child }

  it "is named after its parent" do
    expect(subject.to_s).to eq("RSpec::Core::ExampleGroup::Nested_1::Nested_1")
  end

  it "it's a subclass of RSpec::Core::ExampleGroup::Nested_1" do
    subject.ancestors.should include(RSpec::Core::ExampleGroup::Nested_1)
  end

  it "has one example" do
    subject.should have(1).examples
  end

  its(:class) { should eq(Class) }

  context "its example" do
    it "is possible to get its example's description" do
      subject.examples.first.description.should eq("puts an element at the top of the stack")
    end
  end
end

describe "A instance of RSpec::Core::Example" do
  subject { example }

  its(:example_group) { should be(example_group_child) }
end


the_example_group = describe "The self on the block passef to the `it` method" do
  it "it is a instance of RSpec::Core::ExampleGroup" do
    self_on_it_block_class = self.class
    self_on_it_block_class.should be(the_example_group)
  end
end
