class Product
  def self.find_or_create_by!(*); end
end

def visit(*); end
def click_button(*); end

module ProductHelpers
  def buy_product(product_name = 'product')
    product = Product.find_or_create_by!(name: product_name)

    visit "/produtos/#{product_name}"

    click_button "Comprar"
  end
end

World(ProductHelpers)
