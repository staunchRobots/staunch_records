FactoryGirl.define do
  factory :cart_item do
    cart { FactoryGirl.create(:cart) }
    product { FactoryGirl.create(:product) }
  end
end
