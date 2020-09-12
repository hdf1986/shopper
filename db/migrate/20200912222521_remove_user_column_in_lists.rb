class RemoveUserColumnInLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :user
  end
end
