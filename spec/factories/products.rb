FactoryBot.define do
  factory :product do
    name              { Faker::Games::Pokemon.name }
    explanation       { Faker::Games::Pokemon.location }
    category_id       { Faker::Number.within(range: 1..10) }
    condition_id      { Faker::Number.within(range: 1..6) }
    delivery_fee_id   { Faker::Number.within(range: 1..2) }
    prefecture_id     { Faker::Number.within(range: 1..47) }
    delivery_days_id  { Faker::Number.within(range: 1..3) }
    price             { Faker::Number.within(range: 300..9999999) }
    association :user 
  end
end
