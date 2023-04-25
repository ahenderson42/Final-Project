class Customer < ApplicationRecord
  has_many :orders

  validates :full_name, presence: true
  validates :address, presence: true, format: { with: /\A\d+\s+[\w\s]+\s+\w{2,}\s+\d{5}(?:-\d{4})?\z/,
    message: "must be a valid address" }
end
