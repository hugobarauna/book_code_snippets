Dado(/^que estou logado$/) do
  sign_in
end

#Dado /^que estou logado$/, :sign_in

Quando(/^eu compro um produto$/) do
  buy_product
end

Então(/^devo receber um email com os detalhes da compra$/) do
  pending # express the regexp above with the code you wish you had
end
