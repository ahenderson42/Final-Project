class Product < ApplicationRecord
  belongs_to :category
  belongs_to :company

  has_many :product_orders
end
