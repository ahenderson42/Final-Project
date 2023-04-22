class Province < ApplicationRecord


  validates :name, :code, :taxes, presence: true

end
