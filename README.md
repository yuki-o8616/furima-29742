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
| first_name_kana | string | null: false |
| birth_date | string | null: false |

Association

- has_many :items
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
| post_code | string | null:false |
| city | string | null:false |
| house_number| string | null:false |
| phone_number | string | 
| building_name | string	| 

Association

- belongs_to :user 
gem 'active_hash'

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
| introduction	| text | null: false |
| price | integer | null: false |
| item_condition| integer| null: false|
| postage_payer	| integer	 | null: false|
| preparation_day |  integer	 | null: false |
| postage_type | integer	 | null: false|
| prefecture_code	 | integer | null: false |
| category| integer | null: false |

## like テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

Association

- belongs_to :user 
- belongs_to :item

## For product purchase テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user_id | string |null:false |
| item_id | string |null:false |