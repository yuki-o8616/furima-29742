# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email | string | null: false、 unique：true、index：true|
| password | string | null: false |
| family_name | string | null: false |
| first_name | string | null: false |
| family_name_kana | string | null: false |
| birth_year | string | null: false |
| birth_month | string | null: false |
| birth_day | string | null: false |
| status | integer | null: false |
| review | text | null: false |
| user | references | null: false、foreign_key: true |
| item | references | null: false、foreign_key: true |
| evaluation | references | null: false、foreign_key: true |
| deleted_at | datetime | null: false |
| user     | references	| null: false, foreign_key: true |

Association

- has_many :items
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy
- has many :messages dependent: :destroy
- has many :points dependent: :destroy
- has_many :social_providers dependent: :destroy
- has_many :wallets dependent: :destroy
- has_many :reviews dependent: :destroy
- has_many :orders dependent: :destroy

## sns_authentications テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| provider | string | null: false |
| uid      | string | null: false、unique: true |
| token    | test   |        |
| user     | references	| null: false, foreign_key: true | 

Association

- belongs_to :user 

## sending_destinations テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| destination_first_name | string | null: false |
| destination_family_name | string | null: false |
| destination_first_name_kana | string | null:false |
| destination_family_name_kana | string | null:false |
| post_code | integer | null:false |
|  city | string | null:false |
| house_number| string | null:false |
| phone_number | string | unique: true |
| user     | references	| null: false, foreign_key: true |

Association

- belongs_to :user 

## credit_card テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| card_number | integer | null: false, unique: true|
| expiration_year | integer | null: false| 
| expiration_month | integer | null: false| 
| security_code | integer | null: false|
| user     | references	| null: false, foreign_key: true |

Association

- belongs_to :user 

## points テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| point | integer |
| user     | references	| null: false, foreign_key: true |

Association

- belongs_to :user 

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name | string | null: false |
| introduction	| test | null: false |
| price | integer | null: false |
| brand | references	 | foreign_key: true |
| item_condition| references| null: false,foreign_key: true |
| postage_payer	| references	 | null: false,foreign_key: true|
| prefecture_code	 | integer | null: false |
| size | references | null: false,foreign_key:true |
| preparation_day |  references | null: false,foreign_key:true |
| postage_type | references | null: false,foreign_key:true |
| item_img| references	| null: false,foreign_key:true |
| category| references | null: false,foreign_key: true |
| trading_status | enum | null: false|
| seller | references | null: false,foreign_key: true |
| buyer | references	 |foreign_key: true |
| deal_closed_date| timestamp		|

- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_imgs, dependent: :destroy
- has_one :user_evaluation
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_type
- belongs_to :brand
- -belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

## item_img テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| url | sting |  null:false | 
|  item |  references | null: false,foreign_key: true | 

Association

- belongs_to :user 

## like テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

Association

- belongs_to :user 
- belongs_to :item
