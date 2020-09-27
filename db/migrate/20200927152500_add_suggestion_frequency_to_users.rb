class AddSuggestionFrequencyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :suggestion_frequency, :integer, null: false, default: 7
  end
end
