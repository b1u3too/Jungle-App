require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(:name => "Vines")
    end

    it 'will allow a product with all fields to be saved' do
      product = Product.new(name: "Thomas Sanders", price_cents: 999, quantity: 1, category: @category)
      product.save

      expect(product.errors.full_messages).to be_empty
    end

    it 'will block product save if no name is present' do
      product = Product.new(name: nil, price_cents: 999, quantity: 1, category: @category)
      product.save

      expect(product.errors.full_messages).not_to be_empty
    end

    it 'will block product save if no price is present' do
      product = Product.new(name: "Thomas Sanders", price_cents: nil, quantity: 1, category: @category)
      product.save
      puts product.inspect
      puts "ERRORS: #{product.errors.full_messages}"

      expect(product.errors.full_messages).not_to be_empty
    end

    it 'will block product save if no quantity is present' do
      product = Product.new(name: "Thomas Sanders", price_cents: 999, quantity: nil, category: @category)
      product.save

      expect(product.errors.full_messages).not_to be_empty
    end

    it 'will block product save if no category is present' do
      product = Product.new(name: "Thomas Sanders", price_cents: 999, quantity: 1, category: nil)
      product.save

      expect(product.errors.full_messages).not_to be_empty
    end

  end
end
