class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipality, :street_address, :building, :phone_number, :user_id, :item_id, :token

  validates :postcode, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true
  validates :user_id, presence: true, numericality: true
  validates :item_id, presence: true, numericality: true
  validates :token, presence: true

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Address.create(postcode:, prefecture_id:, municipality:, street_address:, building:, phone_number:, purchase_id: purchase.id)
  end
end