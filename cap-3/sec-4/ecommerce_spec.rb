class Category
  attr_reader :subcategories
  attr_reader :name

  def initialize(name)
    @name = name
    @subcategories = []
  end

  def add_subcategories(*subcategories)
    @subcategories += subcategories
  end
end

class Subcategory
  attr_reader :products

  def initialize(name)
    @name = name
    @products = []
  end

  def add_product(product)
    @products << product
  end
end

RSpec.describe Category do
  it "contains all the products of its subcategories" do
    electronics  = Category.new("electronics")
    computers   = Subcategory.new("computers")
    cell_phones = Subcategory.new("cell phones")
    computers.add_product("MacBook")
    cell_phones.add_product("iPhone")

    electronics.add_subcategories(computers, cell_phones)

    expect(electronics).to contain_products("MacBook", "iPhone")
  end
end

RSpec::Matchers.define :contain_products do |*products|
  match do |category|
    subcategories_products = category.subcategories.flat_map(&:products)
    expect(subcategories_products & products).to eq products
  end

  failure_message do |category|
    "expected category '#{category.name}' to contain products #{products}"
  end
end

