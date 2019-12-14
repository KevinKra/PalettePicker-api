FactoryBot.define do
  factory :palette do
    title { Faker::Coffee.blend_name }
    project
  end
end