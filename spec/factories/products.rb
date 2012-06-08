FactoryGirl.define do
  factory :product do
    album 'Foo'
    artist 'Bar'
    category { FactoryGirl.create(:category) }
    qty 99
    price 49.99
    on_sale false
    sale_price 29.99
  end
end
