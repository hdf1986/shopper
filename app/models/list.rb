class List < ApplicationRecord
  validates :name, presence: true
  validates :user, presence: true

  belongs_to :user

  def items
    [1]
  end
end
