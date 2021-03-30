class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :shipping_address

  #attr_accessor :token         Formオブジェクトに記載するため不要
  #validates :token, presence: true    !!!!これあるとターミナルでロールバック起こる。
end
