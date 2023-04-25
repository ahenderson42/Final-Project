class Province < ApplicationRecord

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :code, presence: true, length: { is: 2 }
  validates :taxes, presence: true, numericality: { only_float: true }
  validates :pst, presence: true, numericality: { only_float: true }
  validates :gst, presence: true, numericality: { only_float: true }
  validates :hst, presence: true, numericality: { only_float: true }

end
