main_object = self
puts "main is a singleton instance of Object"
puts "Ancestors of main's class, "
puts "\t" + main_object.class.ancestors.join(", ")

puts "Ancestors of main's singleton class"
puts "\t" + main_object.singleton_class.ancestors.join(", ")

# should and should_not are only added to BasicObject after calling
# describe. Actually only after calling rspec-expectations/matchers/configuration.
#
# RSpec's should is defined in RSpec::Expectations::Syntax.enable_should
describe "Expectations internals" do
  it do
    main_object.should respond_to(:should)
  end

  it do
    # 1.should retorna um objeto RSpec::Matchers::BuiltIn::PositiveOperatorMatcher.
    # Dentro desse objeto é sobrescrito o método ==
    1.should == 1
    1 == 1
  end

  # object.should     returns a PositiveExpectationHandler
  # object.should_not returns a NegativeExpectationHandler
end

