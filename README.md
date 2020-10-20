
# アプリケーション名
DosancoHans

# 概要
北海道地域に特化したハンドメイド作品の専門フリーマーケットアプリです。

<img width="1179" alt="スクリーンショット 2020-10-20 17 32 47" src="https://user-images.githubusercontent.com/70306357/96561464-93756380-12fa-11eb-9f65-00a667d08d2f.png">


# リンク
- URL : https://dosancohans.herokuapp.com/
- GitHubリポジトリ : https://github.com/tatsuhiko-nakayama/dosanco_hans

# 使用技術
- MySQL
- Javascript
- Ruby 2.6.5 / Rails 6.0.3.4
- Rspec
- Amazon S3
- Git / GitHub
- Heroku

# 利用方法
どのユーザーも出品されている商品を閲覧することができます。
出品、購入を行うためにはユーザー登録を行いログインする必要があります。

# テスト用アカウント
- 出品者用
  - Email : tester@1
  - Pass : tester1
- 購入者用
  - Email : tester@2
  - Pass : tester2
- 購入者用テストカード情報(登録済)
  - 番号 : 4242424242424242
  - 期限 : 現在以降
  - CVC : 123

# アプリの目的・意義・着想
北海道にはクリエイターがたくさんいるにも関わらず、クリエイターとユーザーを結びつける場所がなかったため、地域に特化したマーケットサイトを作成しました。
「北海道」というつながりを大切にするため、ユーザー同士がコミュニケーションしやすいアプリケーションになるよう設計、実装を行いました。

# 要件定義
※後日update

# 機能一覧
◆ユーザー機能
- deviseを使用
- SNSログイン認証
  - Google
  - Facebook
- マイページ機能
  - 「いいね」した商品のリスト表示
  - 出品した商品のリスト表示
  - クレジットカード登録機能
  - ユーザー情報編集、削除機能

◆出品機能
- 出品、編集、削除機能
- 画像のアップロードはActiveStorageを使用

◆レビューコメント機能(for商品)
- コメント表示、投稿、削除機能

◆いいね機能(for商品)

◆コメント数・いいね数表示機能
- 一覧表示内にコメント数、いいね数を掲載

◆商品検索機能
- カテゴリ別検索
- 商品名フリーワード検索

◆サジェスト機能
- 閲覧商品の前後に登録された商品をサジェスト

# 今後実装したい項目
- 出品物の選択（一括）削除機能
- 出品した商品の閲覧数の表示
- 出品した商品のアナリティクス機能
- お気に入りの出品者を記録できる機能
- 商品画像の複数登録＆スライド表示

# ER図
![dosanco_hans ER図](https://user-images.githubusercontent.com/70306357/96569972-c6245980-1304-11eb-9577-b56987d24d12.png)

# テーブル設計

## users テーブル

| Column       | Type    | Options                   |
| ------------ | ------- | ------------------------- |
| name         | string  | null: false               |
| nickname     | string  | null: false, unique: true |
| email        | string  | null: false               |
| password     | string  | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments
- has_many :sns_credentials
- has_one  :card
- has_many :likes

## sns_credentials テーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| provider  | string     | null: false                     |
| uid       | string     | null: false                     |
| user      | references | null: false, foreign_key: true  |

### Association

- belongs_to :user

## cards テーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| card_token     | string     | null: false                     |
| customer_token | string     | null: false                     |
| user           | references | null: false, foreign_key: true  |

### Association

- belongs_to :user

## items テーブル

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
- has_many               :likes
- belongs_to             :user
- has_one_attached       :image
- belongs_to_active_hash :category
- belongs_to_active_hash :from
- belongs_to_active_hash :day

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user
- belongs_to :item

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
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## likes テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item