class RemoveNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :item_comment, :text
  end
end
