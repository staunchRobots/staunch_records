FactoryGirl.define do
  factory :product do
    album  "Album 1"
    artist "Artist 1 "
    description 'test description'
    category { FactoryGirl.create(:category) }
    price 100
    qty 10
    sale_price 80 
    on_sale false
  end

  factory :product_without_category, parent: :product do
    category { nil }
  end
  
end
