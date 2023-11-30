class ShippingCostOn < ActiveHash::Base
  self.data = [
    { id: 1, value: '---' },
    { id: 2, value: '着払い(購入者負担)' },
    { id: 3, value: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end
