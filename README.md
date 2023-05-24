## furima ER図

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |

### Association
- has_many :products
- has_many :purchase_records

## productsテーブル


| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| title       | text       | null: false                    |
| description | text       | null: false                    |
| price       | string     | null: false                    |
| condition   | text       | null: false                    |
| category_id | string     | null: false                    |
| seller_id   | references | null: false, foreign_key: true |
| buyer_id    | references | null: false, foreign_key: true |
### Association
- belongs_to :users
- has_one :purchase_records

## purchase_recordsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| product_id | references | null: false, foreign_key: true |
| buyer_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :products
- has_one :shipping_infomations

## shipping_informationsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| address      | string     | null: false                    |
| postal_code  | string     | null: false                    |
| phone_number | string     | null: false                    |

### Association
- has_one :purchase_records