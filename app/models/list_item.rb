class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :product

  scope :unchecked, -> { where(checked_at: nil) }

  monetize :product_price_cents, allow_nil: true

  def last_product_price
    ListItem.where(product: product).where.not(id: id).order(id: :desc).first&.product_price
  end
end
