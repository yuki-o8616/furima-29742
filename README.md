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
| birth_day | date | null: false |

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
| phone_number | string | null:false |
| building_name | string	| 
| prefectures_id | integer |null:false |
| user | references | null: false, foreign_key: true |

Association

- belongs_to : purchase 

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
| name | string | null: false, foreign_key: true |
| introduction| text | null: false, foreign_key: true |
| price | integer | null: false, foreign_key: true |
| condition_id| integer| null: false,foreign_key: true|
| postage_payer_id	| integer	 | null: false,foreign_key: true|
| preparation_day_id |  integer | null: false ,foreign_key: true|
| postage_type_id | integer	 | null: false,foreign_key: true|
| prefecture_code_id | integer | null: false,foreign_key: true |
| category_id| integer | null: false,foreign_key: true |

Association

- belongs_to :user 
- has_one :purchase



## like テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

Association

- belongs_to :user 
- belongs_to :item

##  purchase テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user| references |null:false, foreign_key: true |
| item |references |null:false, foreign_key: true |

Association

- belongs_to :item
- has_one :sending_destination
- belongs_to :user