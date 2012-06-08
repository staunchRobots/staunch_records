require 'spec_helper'

describe Product do

  context 'base' do
    it 'should have valid factory'
  end

  context 'associations' do
    context 'category' do
      it 'should return category model'
    end

    context 'cart_items' do
      it 'should return empty array if no cart items associated'
      it 'should return array of cart_item object'
    end

    context 'carts' do
      it 'should return empty array if product is not in any carts'
      it 'should return array of carts if carts contain this product'
    end
  end

  context 'validations' do
    context 'presence' do
      it 'should validate presence of album'
      it 'should validate presence of artist'
      it 'should validate presence of category_id'
      it 'should validate presence of qty'
      it 'should validate presence of price'
    end
    context 'numericality' do
      it 'should validate numericality of qty'
      it 'should validate numericality of price'
      it 'should validate numericality of sale_price'
    end
    context 'inclusion' do
      it 'should validate inclusion of on_sale'
    end
  end

  context 'methods' do
    it 'should return sale price if product is on sale and price - otherwise'
  end

  context 'search' do
    it 'should be searchable' # check out sunspot documentation on testing(if exists)
  end

  context 'frienly_id' do
    it 'should have friendly id as album' # check out friendly_id documentation on testing(if exists)
  end

  context 'attached files' do
    it 'should have attached file picture' # check out paperclip documentation on testing(if exists)
  end

end
