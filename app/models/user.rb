class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 5 }
  validates :name, presence: true
  validates :email, uniqueness: true
end
