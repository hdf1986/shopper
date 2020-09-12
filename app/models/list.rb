class List < ApplicationRecord
  validates :name, presence: true

  def items
    [1]
  end
end
