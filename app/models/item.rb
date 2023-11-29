class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numerality: { other_than: 1 }
  validates :condition_id, presence: true, numerality: { other_than: 1 }
  validates :shipping_cost_on, presence: true, numerality: { other_than: 1 }
  validates :prefecture_id, presence: true, numerality: { other_than: 1 }
  validates :days_to_shipping_id, presence: true, numerality: { other_than: 1 }
  validates :price, presence: true, numerality: true
end
