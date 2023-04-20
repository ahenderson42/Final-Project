class Order < ApplicationRecord
  belongs_to :customer

  enum enum_status: [:unpaid, :paid, :shipped]

  validates :total_price, presence: true
end
