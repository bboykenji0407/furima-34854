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


# Users テーブル

|  column    |  type  |    option   |
|------------|--------|-------------|
| nickname   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
|first_name_kana| string | null: false |
|last_name_kana | string | null: false |
|encrypted_password   | string | null: false  |
| email      |string |unique: true, null: false |
|date_of_birth | date | null: false |

# Association

###  - has_many :items
###  - has_many :purchases



# Items テーブル

|  column     |  type   |   option    |
|-------------|---------|-------------|
|  user       | references | foreign key: true |
|  name       | string  | null: false |
|  price      | integer | null: false |
|description  | text    | null: false |
| state_id    | integer | null: false |
| category_id | integer | null: false |
| burden_id   | integer | null: false |
| area_id     | integer | null: false |
| day_id      | integer | null: false |


# Association

### - belongs_to :user
### - has_one :purchase


# Purchases テーブル

|  column  |   type   |  option  |
|----------|----------|----------|
| user     | references|foreign_key: true |
| item     | references|foreign_key: true |


# Association

### - belongs_to :user
### - belongs_to :item
### - has_one :shipping_address

#  Shipping_address テーブル 

|  column  |  type    | option   |
|----------|----------|----------|
|purchase  |references | foreign_key: true|
| postal_code| string(7)| null: false |
| area_id  | integer   | null: false  |
|  city    | string     | null: false |
| street   | string     | null: false |
| building | string     |  
| tell_num | string     | null: false |

# Association

### - belongs_to :purchase

