class Product < ApplicationRecord
  belongs_to :category
  belongs_to :company


  validates :name, :price, :location, presence: true


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
