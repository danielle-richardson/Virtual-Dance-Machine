class Dancer < ApplicationRecord

    has_many :comments 
    has_many :commented_dance_classes, through: :comments, source: :dance_class 
    has_many :dance_classes
    
    validates :username, uniqueness: true, presence: true   
    
    has_secure_password 

end
