class Address < ApplicationRecord
  validates :postcode, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :building
  validates :phone_number, presence: true

  belongs_to :purchase
end
