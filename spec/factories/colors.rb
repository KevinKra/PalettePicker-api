FactoryBot.define do
  factory :color do
    hex_code { "#" + Faker::Number.number(6) }
  end
end