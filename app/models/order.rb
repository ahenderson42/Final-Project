class Order < ApplicationRecord
  belongs_to :shopper

  has_many :product_orders
end
