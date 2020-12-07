class DanceClass < ApplicationRecord
  belongs_to :category
  belongs_to :dancer
  has_many :comments
  has_many :dancers, through: :comments
  has_one_attached :image

  def self.alpha
    order(:type)
  end

end
