class ItemPurchase
  include ActiveModel::Model
  attr_accessor :name, :introduction, :price, :content, :prefecture_id, :condition_id, :postage_payer_id, :preparation_day_id, :category_id, :image 