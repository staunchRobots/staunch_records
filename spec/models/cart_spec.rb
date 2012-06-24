require 'spec_helper'

describe Cart do

  context 'base' do
    it 'should have valid factory' do
      FactoryGirl.build(:cart).should be_valid
    end
  end

  context 'associations' do
    context 'user' do
      it 'should return user model' do
        cart = FactoryGirl.create(:cart)
        cart.user.should be_an_instance_of(User)
      end
    end

    context 'cart_items' do
      it 'should return empty array if no cart items associated' do
        cart = FactoryGirl.create(:cart)
        cart.cart_items.should be_empty
      end

      it 'should return array of cart_item object' do
        cart = FactoryGirl.create(:cart)
        cart_item_one = FactoryGirl.create(:cart_item, cart: cart)
        cart_item_two = FactoryGirl.create(:cart_item, cart: cart)

        cart.cart_items.should eq([cart_item_one, cart_item_two])
      end
    end

    context 'products' do
      it 'should return empty array if there is no products in the cart' do
        cart = FactoryGirl.create(:cart)
        cart.products.should be_empty
      end

      it 'should return array of products if have products in the cart' do
        cart = FactoryGirl.create(:cart)

        product_one = FactoryGirl.create(:product)
        CartItem.create(cart: cart, product: product_one)

        product_two = FactoryGirl.create(:product)
        CartItem.create(cart: cart, product: product_two)

        cart.products.should eq([product_one, product_two])
      end
    end
  end

  context 'methods' do
    before do
      @cart = FactoryGirl.create(:cart)

      @product_one = FactoryGirl.create(:product)
      CartItem.create(cart: @cart, product: @product_one)

      @product_two = FactoryGirl.create(:product, on_sale: true)
      CartItem.create(cart: @cart, product: @product_two)
    end

    it 'create_user_cart should create a cart for a given user_id' do
      user = FactoryGirl.create(:user, email: 'other@example.com')
      Cart.create_user_cart(user).should be_an_instance_of(Cart)
    end

    it 'total should return summary of product prices in the cart' do
      @cart.total == (@product_one.price + @product_two.sale_price)
    end

    it 'clear should delete all products in the cart' do
      @cart.clear
      @cart.products.should be_empty
    end
  end
end
