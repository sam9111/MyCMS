class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item
  validates :menu_item_id, presence: true
end
