class Day < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '在庫あり/即日出荷' },
    { id: 3, name: '2〜3日で発送' },
    { id: 4, name: '1週間以内に発送' },
    { id: 5, name: '2週間以内に発送' },
    { id: 6, name: '1ヵ月以内に発送' },
    { id: 7, name: '1ヵ月以上かかります' }
  ]
end
