class Cart
  def initialize(*products)
    @products = products
  end

  def empty?
    @products.empty?
  end

  def has_products?
    !@products.empty?
  end
end

describe Cart do
  describe "#empty?" do
    it "returns true when the cart has no products" do
      cart = Cart.new

      expect(cart.empty?).to be_true
      expect(cart).to be_empty
    end
  end

  describe "#has_products?" do
    it "returns true if it has products" do
      product = double("product")
      cart = Cart.new(product)

      expect(cart.has_products?).to be_true
      expect(cart).to have_products
    end
  end
end
