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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| items_name        | string | null: false |
| items_description | string | null: false |


### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| first_name         | references | null: false, foreign_key: true |
| last_name          | references | null: false, foreign_key: true |
| first_name_kana    | references | null: false, foreign_key: true |
| last_name_kana     | references | null: false, foreign_key: true |
| items_name         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## shippings テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | string     | null: false |
| municipalities | string     | null: false |
| block          | string     | null: false |
| building_name  | string     | null: false |
| phone_number   | string     | null: false |

### Association

- belongs_to :purchase