When("somo {int} + {int}") do |a, b|
  @result = a + b
end

Then("o resultado é {int}") do |expected_result|
  expect(@result).to eq(expected_result)
end
