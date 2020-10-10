FactoryBot.define do
  factory :card do
    card_token { 'abcdefg' }
    customer_token { 'hijklmn' }
    association :user
  end
end
