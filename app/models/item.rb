class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :user, optional: true
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :image
    validates :price_range_valid?
    validates :category_id, :condition_id, :postage_payer_id, :preparation_day_id, :prefecture_id, numericality: { other_than: 1, message: 'You need to select' }
    validates :category_id, numericality: {  other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :postage_payer_id, numericality: { other_than: 1, message: 'Select' }
    validates :preparation_day_id, numericality: { other_than: 1, message: 'Select' }

  end

  private

  def price_range_valid?
    input = price.to_i
    if input < 300 || input > 9_999_999
      errors.add(:price, 'range invalid')
    else
      true
    end
  end
end
