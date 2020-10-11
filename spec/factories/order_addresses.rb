FactoryBot.define do
  factory :order_address do
    postal_code { '000-0000'}
    city { '札幌市'}
    house_num { '1-1-1' }
    building { 'build' }
    phone { '09012345678'}
    user_id { 1 }
    item_id { 1 }
    token { 1 }
  end
end
