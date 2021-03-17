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
| first_name | string | null: false |
| last_name  | string | null: false |
|first_name_kana| string | null: false |
|last_name_kana | string | null: false |
|encrypted_password   | string | null: false  |
| email    | string |unique: true, null: false |
|date_of_birth | date | null: false |

# Association

###  - has_many :items
###  - has_many :purchases
###  - has_many :shipping address 



# Items テーブル

|  column     |  type   |   option    |
|-------------|---------|-------------|
|  user_id    | references | foreign key: true |
|  price      | integer | null: false |
| date        | text    | null: false |
|description  | text    | null: false |
| state       | integer | null: false |
| category_id | integer | null: false |
| burden_id   | integer | null: false |
| Area_id     | integer | null: false |
| day_id      | integer | null: false |


# Association

### - belongs_to :user
### - has_one :purchase


# Purchase テーブル

|  column  |   type   |  option  |
|----------|----------|----------|
| user_id  | references|foreign_key: true |
| item_id  | references|foreign_key: true |
| item_name| string   | unique: true  |

# Association

### - belongs_to :user
### - belongs_to :item
### - has_one :shipping address

#  shipping address テーブル 

|  column  |  type    | option   |
|----------|----------|----------|
|purchase_id|references | foreign_key: true
| postal_code| string(7) | null: false |
| address  | string     | null: false  |
|  city    | string  | null: false |
| street   | string     | null: false |
| building | string     |  
| tell_num | string   | null: false |

# Association

### - belongs_to :purchase

