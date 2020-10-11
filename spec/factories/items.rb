FactoryBot.define do
  factory :item do
    name { Faker::Food.fruits }
    info { Faker::Food.description }
    price { Faker::Number.between(from: 100, to: 9_999_999) }
    category_id { 2 }
    from_id { 2 }
    day_id { 2 }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
