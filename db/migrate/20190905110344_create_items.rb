class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                  null: false
      t.string :postage,               null: false
      t.string :region,                null: false
      t.string :shipping_date,         null: false
      t.string :way,                   null: false
      t.integer :seller_id,            null: false, foreign_key: true
      t.integer :buyer_id,            foreign_key: true
      t.integer :categorys_id,         foreign_key: true
      t.integer :price,                null: false
      t.string :state,                 null: false
      t.text :description 
      t.integer :votes_item_id,        foreign_key: true

      t.timestamps
    end
  end
end
