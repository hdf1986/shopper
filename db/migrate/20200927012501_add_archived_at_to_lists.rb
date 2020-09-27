class AddArchivedAtToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :archived_at, :datetime
  end
end
