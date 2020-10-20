# # < User登録 >
# 5.times do |i|
#   User.create(id: "#{i+1}", name: "tester#{i+1}", nickname: "tester#{i+1}", email: "tester@#{i+1}", password: "tester#{i+1}")
# end
# # < /User登録 >

# # < Item登録 >
# 10.times do |i|
#   # Furniture Category (id:2)
#   funiture = Item.new(category_id: '2',name: "Furniture test#{i+1}",info: 'Information is displayed here', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   funiture.image.attach(io: File.open('./app/assets/test_images/furniture.jpg'), filename: 'furniture.jpg')
#   funiture.save

#   # Accessory Category (id:3)
#   accessory = Item.new(category_id: '3',name: "Accessory test#{i+1}",info: 'Information is displayed here', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   accessory.image.attach(io: File.open('./app/assets/test_images/accessory.jpg'), filename: 'accessory.jpg')
#   accessory.save

#   # Fashion Category (id:4)
#   fashion = Item.new(category_id: '4',name: "Fashion test#{i+1}",info: 'Information is displayed here', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   fashion.image.attach(io: File.open('./app/assets/test_images/fashion.jpg'), filename: 'fashion.jpg')
#   fashion.save

#   # Designed_Mask Category (id:5)
#   designed_mask = Item.new(category_id: '5',name: "Designed_mask test#{i+1}",info: 'Information is displayed here', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   designed_mask.image.attach(io: File.open('./app/assets/test_images/designed_mask.jpg'), filename: 'designed_mask.jpg')
#   designed_mask.save
#   # Bag & Pouch Category (id:6)
#   bag = Item.new(category_id: '6',name: "Bag test#{i+1}",info: 'Information is displayed here', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   bag.image.attach(io: File.open('./app/assets/test_images/bag.jpg'), filename: 'bag.jpg')
#   bag.save

#   # Knitting Category (id:7)
#   knitting = Item.new(category_id: '7',name: "Knitting test#{i+1}",info: 'Information is displayed here', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   knitting.image.attach(io: File.open('./app/assets/test_images/knitting.jpg'), filename: 'knitting.jpg')
#   knitting.save
#   # Toy Category (id:8)
#   toy = Item.new(category_id: '8',name: "Toy test#{i+1}",info: 'Information is displayed here  ', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   toy.image.attach(io: File.open('./app/assets/test_images/toy.jpg'), filename: 'toy.jpg')
#   toy.save

#   # Art Category (id:9)
#   art = Item.new(category_id: '9',name: "Art test#{i+1}",info: 'Information is displayed here', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   art.image.attach(io: File.open('./app/assets/test_images/art.jpg'), filename: 'art.jpg')
#   art.save

#   # Other Category (id:10)
#   other = Item.new(category_id: '10',name: "Other test#{i+1}",info: 'Information is displayed here', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   other.image.attach(io: File.open('./app/assets/test_images/other.jpg'), filename: 'other.jpg')
#   other.save

#   # 日本語データ登録 (全角チェック)
#   japanese = Item.new(category_id: '10',name: "日本らしい写真 テスト#{i+1}",info: 'ここに説明文が入ります', price: '9999', from_id: '2', day_id: '2', user_id: '1')
#   japanese.image.attach(io: File.open('./app/assets/test_images/japanese.jpg'), filename: 'jananese.jpg')
#   japanese.save

# end
# # < /Item登録 >

# # < Comment登録 >
# 10.times do |i|
#   Comment.create(message: "出品しました！", user_id: '1', item_id: "#{901+(10*i)}")
#   Comment.create(message: "素敵な商品ですね", user_id: '2', item_id: "#{901+(10*i)}")
#   Comment.create(message: "Looks good to me !", user_id: '3', item_id: "#{901+(10*i)}")
# end
# # < /Comment登録 >

# # < Like登録 >
# 10.times do |i|
#   Like.create(user_id: '1', item_id: "#{901+(10*i)}")
#   Like.create(user_id: '2', item_id: "#{901+(10*i)}")
#   Like.create(user_id: '3', item_id: "#{901+(10*i)}")
#   Like.create(user_id: '4', item_id: "#{901+(10*i)}")
#   Like.create(user_id: '5', item_id: "#{901+(10*i)}")
# end
# # < /Like登録 >

# # < Order & Address登録 >
# Order.create(user_id: '2', item_id: "981")
# Address.create(postal_code: '000-0000', city: 'Sapporo', house_num: '1-1-1', phone: '09012345678', order_id: '1')
# Order.create(user_id: '2', item_id: "961")
# Address.create(postal_code: '012-3456', city: 'Kushiro', house_num: 'onbetsucho', phone: '09099999999', order_id: '2')
# # < /Order & Address登録 >