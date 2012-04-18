class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates_presence_of :cart_id, :product_id
end
