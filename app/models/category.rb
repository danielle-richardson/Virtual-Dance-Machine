class Category < ApplicationRecord

    has_many :dance_classes
  

    scope :filter_duplicates, -> { group(:name).having("count(*) >= 1")}

    def self.order_by_size
        order(dance_classes: :desc)
    end
end
