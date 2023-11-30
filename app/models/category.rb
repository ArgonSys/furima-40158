class Category < ActiveHash::Base
  self.data = [
    { id: 1, value: '---' },
    { id: 2, value: 'メンズ' },
    { id: 3, value: 'レディース' },
    { id: 4, value: 'ベビー・キッズ' },
    { id: 5, value: 'インテリア・住まい・小物' },
    { id: 6, value: '本・音楽・ゲーム' },
    { id: 7, value: 'おもちゃ・ホビー・グッズ' },
    { id: 8, value: '家電・スマホ・カメラ' },
    { id: 9, value: 'スポーツ・レジャー' },
    { id: 10, value: 'ハンドメイド' },
    { id: 11, value: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
