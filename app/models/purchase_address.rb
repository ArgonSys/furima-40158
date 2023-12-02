class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipality, :street_address, :building, :phone_number, :user_id, :item_id, :token

  REGEXP_POSTCODE = /\A\d{3}-\d{4}\z/
  REGEXP_PHONE_NUMBER = /\A\d{10,11}\z/
  with_options presence: true do
    validates :postcode, format: { with: REGEXP_POSTCODE }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :street_address
    validates :phone_number, format: { with: REGEXP_PHONE_NUMBER }
    validates :user_id, numericality: true
    validates :item_id, numericality: true
    validates :token
  end

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Address.create(postcode:, prefecture_id:, municipality:, street_address:, building:, phone_number:, purchase_id: purchase.id)
  end
end
