# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| interest1_id | integer | null: false |
| interest2_id | integer | null: false |
| interest3_id | integer | null: false |

### Association

- has_many               :products
- has_many               :orders
- has_many               :comments
- has_one                :card
- belongs_to_active_hash :interest1
- belongs_to_active_hash :interest2
- belongs_to_active_hash :interest3

## cards テーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| card_token     | string     | null: false                     |
| customer_token | string     | null: false                     |
| user           | references | null: false, foreign_key: true  |

### Association

- belongs_to :user

## products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| info        | text       | null: false                    |
| price       | integer    | null: false                    |
| category_id | integer    | null: false                    |
| from_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_one                :order
- has_many               :comments
- belongs_to             :user
- has_one_attached       :image
- belongs_to_active_hash :category
- belongs_to_active_hash :from
- belongs_to_active_hash :day

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user
- belongs_to :product

## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| city        | string     | null: false                    |
| house_num   | string     | null: false                    |
| building    | string     |                                |
| phone       | string     | null: false                    |
| order       | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product