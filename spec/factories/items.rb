FactoryBot.define do
  factory :item do
    name { "商品名テスト" }
    introduction {"アクセサリー"}
    price {"1200"}
    condition_id {"clean"}
    postage_payer_id {"1"}
    preparation_day_id {"2"}
    postage_type_id {"3"}
    prefecture_code_id{"2"}
    category_id {"2"}
  end
end
