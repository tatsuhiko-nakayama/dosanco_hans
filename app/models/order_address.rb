class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :house_num, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'を正しく入力してください' }
    validates :city
    validates :house_num
    validates :phone, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'を正しく入力してください' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, house_num: house_num, building: building, phone: phone, order_id: order.id)
  end
end
