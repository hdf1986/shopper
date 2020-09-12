class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :category, null: true, foreign_key: true
      t.string :name
      t.integer :price_cents
      t.string :picture_url

      t.timestamps
    end
  end
end
