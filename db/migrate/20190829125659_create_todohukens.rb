class CreateTodohukens < ActiveRecord::Migration[5.2]
  def change
    create_table :todohukens do |t|
      t.integer :prefecture_id
      t.string :city

      t.timestamps
    end
  end
end
