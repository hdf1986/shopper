class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :product

  scope :unchecked, -> { where(checked_at: nil) }
end
