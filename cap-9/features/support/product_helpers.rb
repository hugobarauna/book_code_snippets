module ProductHelpers
  def buy_product(product_name)
    product = Product.find_by(name: product_name) or
                Product.create!(name: product_name)

    visit "/produtos/#{product_name}"

    click_button 'Comprar'
  end
end

World(ProductHelpers)
