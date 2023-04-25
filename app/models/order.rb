class Order < ApplicationRecord
  belongs_to :customer

  enum enum_status: [:unpaid, :paid, :shipped]

  validates :total_price, presence: true, numericality: { only_float: true }
  validates :enum_status, presence: true, numericality: { only_integer: true }
end
