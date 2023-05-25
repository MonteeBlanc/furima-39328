## furima ER図

## usersテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| name               | string | null: false              |
| name_katakana      | string | null: false              |
| surname            | string | null: false              |
| surname_katakana   | string | null: false              |
| date_of_birth      | date   | null: false              |

### Association
- has_many :products
- has_many :purchase_records

## productsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| title                 | string     | null: false                    |
| description           | text       | null: false                    |
| price                 | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| category_id           | integer    | null: false                    |
| shipping_days_id      | integer    | null: false                    |
| shipping_fee_payer_id | string     | null: false                    |
| shipping_area_id      | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record
- belongs_to_active_hash :condition
- belongs_to_active_hash :category
- belongs_to_active_hash :shipping_days
- belongs_to_active_hash :shipping_fee_payer
- belongs_to_active_hash :shipping_area

## purchase_recordsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| product    | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :shipping_infomation

## shipping_informationsテーブル

| Column           | Type           | Options                        |
| ---------------- | -------------- | ------------------------------ |
| postal_code      | string         | null: false                    |
| phone_number     | string         | null: false                    |
| shipping_area_id | integer        | null: false                    |
| city             | string         | null: false                    |
| street           | string         | null: false                    |
| building         | string         |                                |
| purchase_record  | references     | null: false, foreign_key: true |



### Association
- has_one :purchase_record