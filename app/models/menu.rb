class Menu < ApplicationRecord
  has_many :menu_items
  validates :name, presence: true
  validates_uniqueness_of :active
end
