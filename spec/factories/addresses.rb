FactoryBot.define do
  factory :address do
    postal_code    { '123-4567' }
    prefecture_id  { Faker::Number.within(range: 1..47) }
    city           { '東京都' }
    house_number   { '1-1' }
    building_name  { '東京ハイツ' }
    phone_number   { Faker::Number.number(digits: 11) }
    association :order
  end
end
