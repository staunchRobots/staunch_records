FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'user123'
  end

  factory :admin do
    email 'admin@example.com'
    password 'admin123'
    admin true
  end
end
