Given(/^somo (.*)$/) do |summation|
  @result = eval(summation)
end

Given(/^o resultado é (\d+)$/) do |expected_result|
  expect(@result).to eq(expected_result.to_i)
end
