FactoryBot.define do
  factory :user do
    sequence(:email){ |n| "user_#{n}@example.com" }
    sequence(:name) { |n| "name{n}" }
    gender {:man}
    age {:ten}
    password { "password" }
    password_confirmation { "password" }
  end
end
