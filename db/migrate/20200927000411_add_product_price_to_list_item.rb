class AddProductPriceToListItem < ActiveRecord::Migration[6.0]
  def change
    add_column :list_items, :product_price_cents, :integer
  end
end
