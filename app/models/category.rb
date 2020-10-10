class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '家具・雑貨' },
    { id: 3, name: 'アクセサリー' },
    { id: 4, name: '服・ファッション' },
    { id: 5, name: 'デザインマスク' },
    { id: 6, name: 'バッグ・財布・ポシェット' },
    { id: 7, name: 'ニット・編み物' },
    { id: 8, name: 'ぬいぐるみ・おもちゃ' },
    { id: 9, name: 'アート' },
    { id: 10, name: 'その他' }
  ]
end
