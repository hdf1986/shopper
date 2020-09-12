class AddAmountToListItems < ActiveRecord::Migration[6.0]
  def change
    add_column :list_items, :amount, :integer
  end
end
