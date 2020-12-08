class Dancer < ApplicationRecord
    has_many :comments 
    has_many :dance_classes, through: :comments
    has_many :dance_classes
    
    validates :username, uniqueness: true, presence: true, length: { minimum: 5}   
    validates :email, uniqueness: true, presence: true
    validates :password, length: { in: 6..100 }

    has_secure_password 
    has_one_attached :image



  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(email: auth[:info][:email]) do |u|
      u.username = auth["info"]["name"]
      u.password = SecureRandom.hex
    end
  end

end
