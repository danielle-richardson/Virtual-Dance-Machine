class Comment < ApplicationRecord
  belongs_to :dancer
  belongs_to :dance_class

  validates :title, presence: true

end
