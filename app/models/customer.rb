class Customer < ApplicationRecord
  has_many :orders

  validates :full_name, :address, presence: true
end
