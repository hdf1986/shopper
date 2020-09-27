class AddFinalAmountToListItem < ActiveRecord::Migration[6.0]
  def change
    add_column :list_items, :final_amount, :integer
  end
end
