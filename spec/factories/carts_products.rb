FactoryBot.define do
  factory :carts_product do
    association :cart
    association :product
    quantity { rand(1..5) }
  end
end
