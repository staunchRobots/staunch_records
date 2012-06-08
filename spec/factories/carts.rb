FactoryGirl.define do
  factory :cart do
    user { FactoryGirl.create(:user) }
  end
end
