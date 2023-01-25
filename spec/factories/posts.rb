FactoryBot.define do
  factory :post do
    budget { 12345 }
    body { "test_content" }
    association :user
  end
end
