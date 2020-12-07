class Category < ApplicationRecord

    has_many :dance_classes
    validates :name, presence: true, uniqueness: true

    scope :alpha -> {order(:name)}
end
