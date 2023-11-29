FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(min_numeric: 1, min_alpha: 1)[0, 128] }
    password_confirmation { password }
    gimei = Gimei.name
    first_name { gimei.given.kanji }
    last_name { gimei.family.kanji }
    first_name_kana { gimei.given.katakana }
    last_name_kana { gimei.family.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: 5.years.ago) }
  end
end
