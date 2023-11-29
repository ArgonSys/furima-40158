class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numerality: { other_than: 1 }
  validates :condition_id, presence: true, numerality: { other_than: 1 }
  validates :shipping_cost_on, presence: true, numerality: { other_than: 1 }
  validates :prefecture_id, presence: true, numerality: { other_than: 1 }
  validates :days_to_shipping_id, presence: true, numerality: { other_than: 1 }
  validates :price, presence: true, numerality: true

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost_on
  belongs_to :prefecture
  belongs_to :days_to_shipping
end
