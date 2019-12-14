FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { Fake::Coffee.variety }
  end
end