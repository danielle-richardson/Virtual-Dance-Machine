class DanceClass < ApplicationRecord
  belongs_to :category
  belongs_to :dancer
  has_many :comments
  has_many :dancers, through: :comments
  has_one_attached :image

  validates :type, presence: true

  def self.alpha
    order(:type)
  end

  def category_attributes=(attributes)
    self.category = Category.find_or_create_by(attributes) if !attributes['name'].empty?
    self.category
  end

  def thumbnail
    self.image.variant(resize: "100x100")
  end

  def category_name
    category.try(:name)
  end

  def type_and_category
    "#{type} - #{category.try(:name)}"
  end

end
