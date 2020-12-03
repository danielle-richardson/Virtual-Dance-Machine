class Comment < ApplicationRecord
  belongs_to :dancer
  belongs_to :dance_class
end
