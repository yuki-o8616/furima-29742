class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  with_options presence: true do
    #画像のバリデーション
    validates :name
    validates :introduction
    validates :price
    # validates :image
  

    validates :condition_id   #名前合わせる
    validates :postage_payer_id
    validates :preparation_day_id
    validates :prefecture_id
    validates :category_id
  end

  #アクティブストレージとのアソシエーション
  # has_one :purchase
  has_one_attached :image

  #AvtiveHashとのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day



end
