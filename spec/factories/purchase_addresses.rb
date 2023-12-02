FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Lorem.word }
    street_address { Faker::Lorem.word }
    building { Faker::Lorem.word }
    phone_number { Faker::Number.number(digits: 10) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
