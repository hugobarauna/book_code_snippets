require 'matrix'

Dado(/^que existe o seguinte cadastro de usuário:$/) do |table|
  # puts "it works"
end

Dado(/^que tenho a matriz A:$/) do |table|
  @a = Matrix[*table.raw]
  @a = @a.map(&:to_i)
end

Dado(/^que tenho a matriz B:$/) do |table|
  @b = Matrix[*table.raw]
  @b = @b.map(&:to_i)
end

Quando(/^multiplico a matriz A com a matriz B$/) do
  @result = @a * @b
end

Então(/^o resultado é:$/) do |table|
  table.diff!(@result.map(&:to_s).to_a)
end
