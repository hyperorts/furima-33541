# README

# テーブル設計
## users テーブル
| Column               | Type   | Options     |
| ----------           | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_kana     | string | null: false |
| first_name_kana      | string | null: false |
| birthday             | date   | null: false |
### Association
- has_many :items
- has_many :deals

## items テーブル
| Column              | Type       | Options                        |
| -----------         | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_ship_id        | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :deal

## deals テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
| Column              | Type       | Options                        |
| -----------         | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefectures_id      | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address_number      | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| deal(FK)           | references | null: false, foreign_key: true |
### Association
- belongs_to :deals