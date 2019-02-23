Quando("somo {int} + {int}") do |a, b|
  @result = a + b
end

Então("o resultado é {int}") do |result|
  expect(@result).to eq(result)
end

Então("o resultado deve ser {int}") do |result|
  expect(@result).to eq(result)
end
