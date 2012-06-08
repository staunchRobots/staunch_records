require 'spec_helper'

describe Cart do
  context 'base' do
    it 'should have valid factory'
  end

  context 'associations' do
    context 'user' do
      it 'should return user model'
    end

    context 'cart_items' do
      it 'shoudl return empty array if no cart items associated'
      it 'should return array of cart_item object'
    end

    context 'products' do
      it 'should return empty array if there is no products in the cart'
      it 'shoudl return array of products if have products in the cart'
    end
  end

  context 'methods' do
    it 'create_user_cart should create a cart for a given user_id'
    it 'total should return summary of product prices in the cart'
    it 'clear should delete all products in the cart'
  end
end
