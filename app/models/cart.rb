class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :products, through: :cart_items

  validates_presence_of :user_id

  # Creates a cart for a newly created user
  def self.create_user_cart(user_id)
    create(user_id: user_id)
  end

  def total
    products.to_a.sum(&:total)
  end
end
