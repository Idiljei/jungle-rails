require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  it "should successfully create a new product" do
    @category = Category.create(name: 'Electronics')
    @product = @category.products.create(name: 'Hotdog Slicer', description: 'test', image: 'test', price_cents: 10000, quantity: 10)
    expect(@product).to be_valid
    @product.errors.full_messages
  end
  it "is not valid without a name present" do
    @category = Category.create(name: 'Electronics')
    @product = @category.products.create(name: nil, description: 'test', image: 'test', price_cents: 10000, quantity: 10)
    expect(@product).not_to be_valid
    @product.errors.full_messages
  end
  it "is not valid without a price present" do
    @category = Category.create(name: 'Electronics')
    @product = @category.products.create(name: 'Optimal Sleeping Bed', description: 'test', image: 'test', price_cents: nil, quantity: 10)
    expect(@product).not_to be_valid
    @product.errors.full_messages
  end
  it "is not valid without a quantity present" do
    @category = Category.create(name: 'Electronics')
    @product = @category.products.create(name: 'World\'s Largest Smartwatch', description: 'test', image: 'test', price_cents: 10000, quantity: nil)
    expect(@product).not_to be_valid
    @product.errors.full_messages
  end
  it "is not valid without a category present" do
    @product = Product.create(name: 'Electric Chair', description: 'test', image: 'test', price_cents: 10000, quantity: 10)
    expect(@product).not_to be_valid
    @product.errors.full_messages
  end
end
end