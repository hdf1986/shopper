class CreateListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.references :list, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.datetime :checked_at

      t.timestamps
    end
  end
end
