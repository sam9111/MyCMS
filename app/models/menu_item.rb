class MenuItem < ApplicationRecord
  belongs_to :menu
  has_many :order_items
  validates :name, presence: true
  validates :price, presence: true
end
