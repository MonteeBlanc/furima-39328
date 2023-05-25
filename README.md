## furima ER図

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| profile            | text   | null: false |
| full_name          | string | null: false |
| full_name_katakana | string | null: false |
| date_of_birth      | date   | null: false |

### Association
- has_many :products
- has_many :purchase_records

## productsテーブル


| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | text       | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| category_id  | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchase_records

## purchase_recordsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| product    | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :products
- has_one :shipping_infomations

## shipping_informationsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| address      | string     | null: false                    |
| postal_code  | string     | null: false                    |
| phone_number | string     | null: false                    |
| credit_card  | string     | null: false                    |
| product      | references | null: false, foreign_key: true |

### Association
- has_one :purchase_records