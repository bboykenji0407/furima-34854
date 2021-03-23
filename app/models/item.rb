class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :state_id
      validates :category_id
      validates :burden_id
      validates :area_id
      validates :day_id
    end
    validates :price, numericality: { greater_than: 300, less_than:9999999 }, format: {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: '半角数字を使用してください'}
  end
end
