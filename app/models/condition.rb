class Condition < ActiveHash::Base
  self.data = [
    { id: 1, value: '---' },
    { id: 2, value: '新品・未使用' },
    { id: 3, value: '未使用に近い' },
    { id: 4, value: '目立った傷や汚れなし' },
    { id: 5, value: 'やや傷や汚れあり' },
    { id: 6, value: '傷や汚れあり' },
    { id: 7, value: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
