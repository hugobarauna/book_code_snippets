Dado(/^que meu programa de hello world está com um erro de sintaxe$/) do
  raise if @tag_1 != 'foo'
end

Quando(/^rodo meu programa de hello world$/) do
  raise if @tag_1 != 'foo'
  raise if @tag_2 != 'foo'
end

Quando(/^eu rodo ele$/) do
end

Entao(/^ele imprime na tela "(.*?)"$/) do |arg1|
end

Então(/^ele não imprime na tela o texto "(.*?)"$/) do |arg1|
end
