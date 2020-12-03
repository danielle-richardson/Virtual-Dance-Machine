class DanceClass < ApplicationRecord
  belongs_to :category
  belongs_to :dancer
end
