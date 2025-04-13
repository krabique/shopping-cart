FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Product #{n}" }
    image_url { "https://example.com/product.png" }
    price { rand(10..100) }
  end
end
