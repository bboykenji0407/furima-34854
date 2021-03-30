class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.references  :purchase,      foreign_key: true
      t.string   :postal_code,   null: false
      t.integer     :area_id,       null: false
      t.string      :city,          null: false
      t.string      :street,        null: false
      t.string      :tell_num,       null: false
      t.string      :building
      t.timestamps
    end
  end
end