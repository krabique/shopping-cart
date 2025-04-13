FactoryBot.define do
  factory :cart do
    discount { nil }

    trait :with_discount do
      discount { rand(1..100) }
    end
  end
end
