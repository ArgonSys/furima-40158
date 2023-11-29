class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_cost_on_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :days_to_shipping_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: true

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost_on
  belongs_to :prefecture
  belongs_to :days_to_shipping
  has_one_attached :image
end
