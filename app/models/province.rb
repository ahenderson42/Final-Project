class Province < ApplicationRecord
  has_many :users

  validates :name, :code, :taxes, presence: true

end
