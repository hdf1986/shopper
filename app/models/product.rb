class Product < ApplicationRecord
  validates :name, presence: true

  belongs_to :category, optional: true
  belongs_to :user, optional: true

  has_many :list_items, dependent: :destroy

  scope :visible_by_user, -> (user) { where.not(approved_at: nil).or(where(user: user)) }

  monetize :price_cents, allow_nil: true

  def last_price
    ListItem.where(product: self).order(id: :desc).first&.product_price
  end
end
