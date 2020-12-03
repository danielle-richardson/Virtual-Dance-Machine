class DanceClass < ApplicationRecord
  belongs_to :category
  belongs_to :dancer

  has_many :comments
  has_many :dancers, through: :comments
end
