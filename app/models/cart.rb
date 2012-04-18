class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :products, through: :cart_items

  def self.create_user_cart(user_id)
    self.create(user_id: user_id)
  end
end
