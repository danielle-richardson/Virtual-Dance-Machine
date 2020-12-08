class Comment < ApplicationRecord
  belongs_to :dancer
  belongs_to :dance_class

  validates :title, presence: true
  validates :content, presence: true

  validates :dance_class, uniqueness: { scope: :dancer, message: "only 1 comment for this post per dancer" }


end
