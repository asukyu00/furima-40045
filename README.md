# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | --------------------------|
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| first_name         | string     | null: false               |
| last_name          | string     | null: false               |
| first_name_kana    | string     | null: false               |
| last_name_kana     | string     | null: false               |
| birth_day          | date       | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options                        |
| -----------------      | ------     | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| item_name              | string     | null: false                    |
| item_description       | text       | null: false                    |
| item_category_id       | integer    | null: false                    |
| item_condition_id      | integer    | null: false                    |
| burden_of_shipping_id  | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| delivery_time_id       | integer    | null: false                    |
| item_price             | integer    | null: false                    |


### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippings テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchase       | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| block          | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |

### Association

- belongs_to :purchase