class ExampleGroup
  def self.describe(description, &example_group_block)
    puts "On describe, with description: #{description}"
    self.new.instance_eval(&example_group_block)
  end

  def self.define_example_method(name)
    module_eval(<<-END_RUBY, __FILE__, __LINE__)
      def #{name}(desc = nil, &block)
        puts "just defined an example named #{name}"
        block.call
      end
    END_RUBY
  end

  define_example_method :it
end

module Dsl
  def describe(description, &example_group_block)
    ExampleGroup.describe(description, &example_group_block)
  end
end

extend(Dsl)

describe "testing example group" do
  it "can create a new example" do
    puts "hell yeah, I can even execute a block passed to the ExampleGroup#it method"
  end
end
