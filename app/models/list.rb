class List < ApplicationRecord
  validates :name, presence: true
  validates :user, presence: true

  belongs_to :user
  has_many :list_items
  has_many :list_shares
  has_many :users, through: :list_shares
  
end
