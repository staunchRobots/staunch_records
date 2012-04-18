class UserObserver < ActiveRecord::Observer
  def after_create(user)
    Cart.create_user_cart(user.id)
  end
end
