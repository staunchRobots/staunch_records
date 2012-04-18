class UserObserver < ActiveRecord::Observer
  def after_create(user)
    puts "Calling method to create cart"
    Cart.create_user_cart(user.id)
  end
end
