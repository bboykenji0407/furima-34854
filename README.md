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

|  column  |  type  |    option   |
|----------|--------|-------------|
| nickname | string | null: false |
| password | string | null: false |
| password_confirmation | string  | null:false |
| email    | string | null: false |
| password | string | null: false |
|date of birth | date | null: false |

# Association

###  - has_many :item
###  - has_many :purchase
###  - has_many :shipping address 
###  - has_many :purchase


# Items テーブル

|  column  |  type   |   option    |
|----------|---------|-------------|
|  item_id | integer | null: false |
|  price   | integer | null: false |
|description| text   | null: false
| category | text    | null: false |
| date     | text    | null: false |
| burden   | text    | null: false |
|Estimated Ship Date | text   |null: false |
| Current Shipping Area| text |null: false |
| shipping days | text | null: false |


# Association

### - belongs_to :user
### - belongs_to :purchase
### - has_one :item


# Purchase テーブル

|  column  |   type   |  option  |
|----------|----------|----------|
| user_id  | string   |foreign_key: true |
| item_id  | integer  |foreign_key: true |
| buyer    | string   | unique: true  |
| order    | integer  | unique: true  |

# Association

### - has_many :user
### - belongs_to :item
### - has_one :shipping address

#  shipping address テーブル 

|  column  |  type    | option   |
|----------|----------|----------|
| user_id  | string   |foreign_key: true|
| item_id  | integer  |foreign_key: true|
| postal_code| integer(7) | null: false |
| address  | text     | null: false  |
|  city    | text     | null: false |
| street   | text     | null: false |
| building | text     | null: false |
| tell num | string   | null: false |

# Association

### - belongs_to :purchase

