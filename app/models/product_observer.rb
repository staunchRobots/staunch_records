class ProductObserver < ActiveRecord::Observer
  def before_update(product)
    if (product.changed_attributes.keys & ["price", "sale_price", "on_sale"]).size > 0
      notify_users_price_changed(product)
    end
  end

  def notify_users_price_changed(product)
    updated_carts = Cart.with_product(product)
    updated_carts.each do |cart|
      UserMailer.product_price_changed(cart.user, product).deliver
    end
  end
end
