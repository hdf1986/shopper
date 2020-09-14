class Product < ApplicationRecord
  validates :name, presence: true

  belongs_to :category, optional: true

  has_many :list_items, dependent: :destroy
end
