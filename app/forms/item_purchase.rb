class ItemPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :prefecture_id, :address, :post_code, :city, :building_name, :phone_number, :house_number, :token, :item_id

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :phone_number, length: { maximum: 11 }, format: { with: /\d{11}/ }
    validates :post_code, format: { with: POSTAL_CODE_REGEX }
    validates :city, :phone_number, :house_number, :user_id, :item_id, :token
  end
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, building_name: building_name, phone_number: phone_number,purchase_id:purchase.id)
  end
end
