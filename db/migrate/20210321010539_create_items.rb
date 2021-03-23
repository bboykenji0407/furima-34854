class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references     :user, foregin_key: true
      t.string        :name,        null: false
      t.integer       :price,       null: false
      t.text          :description, null: false
      t.integer       :state_id,    nill: false
      t.integer       :category_id, null: false
      t.integer       :burden_id,   null: false
      t.integer       :area_id,     null: false
      t.integer       :day_id,      null: false
      t.timestamps
    end
  end
end
