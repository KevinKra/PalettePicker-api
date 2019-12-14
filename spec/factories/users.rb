FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { Faker::Coffee.variety }
    user_id { nil }
  end
end