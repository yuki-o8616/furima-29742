FactoryBot.define do
  factory :item do
    association :user

    name { '商品名テスト' }
    introduction { 'アクセサリー' }
    price { 1200 }
    condition_id { 2 }
    postage_payer_id { 2}
    preparation_day_id {2}
    prefecture_id {2}
    category_id {2}
  end
end
# アクティブハッシュのファイル削除
# アクティブハッシュの部分はinteger型にする
