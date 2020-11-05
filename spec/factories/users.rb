FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    lastname              { Gimei.last.kanji }
    firstname             { Gimei.first.kanji }
    lastname_kana         { Gimei.last.katakana }
    firstname_kana        { Gimei.first.katakana }
    birth_date            { Faker::Date.backward }
  end
end
