class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :street, :building, :tell_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :city
    validates :street
    validates :tell_num,  format: {with: /\A[0-9]+\z/, message: "半角数字のみ使用してください"}
  end

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, street: street, building: building, tell_num: tell_num, purchase_id: purchase.id)
  end

end