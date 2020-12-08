class Comment < ApplicationRecord
  belongs_to :dancer
  belongs_to :dance_class

  validates :title, presence: true
  validates :content, presence: true

  validates :dance_class, uniqueness: { scope: :dancer, message: "Only 1 comment per user" }


end
