class UserMailer < ActionMailer::Base
  default from: "no_reply@staunchrobots.com"

  def product_added_to_cart(user, product)
    @user = user
    @product = product
    mail(to: @user.email, subject: 'Product added to you cart at Staunch Records')
  end

  def product_price_changed(user, product)
    @user = user
    @product = product
    mail(to: @user.email, subject: "Product in you cart have updated it's price")
  end
end
