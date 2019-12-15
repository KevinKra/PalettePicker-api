FactoryBot.define do
  factory :color do
    hex_code { "#" + (Faker::Number.number(digits: 6)).to_s }
    palette
  end
end