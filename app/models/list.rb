class List < ApplicationRecord
  validates :name, presence: true
  validates :user, presence: true

  belongs_to :user
  has_many :list_items
  has_many :list_shares
  has_many :users, through: :list_shares
  
  scope :archived, -> { where.not(archived_at: nil) }
  scope :not_archived, -> { where(archived_at: nil) }
end
