class Product < ApplicationRecord
  belongs_to :category
  belongs_to :company


  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_float: true }
  validates :location, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }


  has_one_attached :image

  def self.search(search, category)
    if search.present? && category.present?
      where('name LIKE ? AND category_id = ?', "%#{search}%", category)
    elsif search.present?
      where('name LIKE ?', "%#{search}%")
    elsif category.present?
      where(category: category)
    else
      all
    end
  end
end
