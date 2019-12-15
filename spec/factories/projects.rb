FactoryBot.define do
  factory :project do
    title { Faker::Name.name }
    description { Faker::Company.bs }
    user
  end
end