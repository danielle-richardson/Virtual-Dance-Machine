class DanceClass < ApplicationRecord
  belongs_to :category
  belongs_to :dancer
  has_many :comments
  has_many :dancers, through: :comments
  has_one_attached :image

  validates :type, presence: true
  validates :description, presence: true
  validate :already_exists

  scope :order_by_comments, -> { left_joins(:comments).group(:id).order("size desc")}


  def self.filter_by_type(value)
    where("type like ?" , "%#{value}%")
  end

  def self.order_by_size
    order(comments: :desc)
  end  

  def self.by_dancer(dancer_id)
    where(dancer: dancer_id)
  end


  def already_exists
    dance_class = DanceClass.find_by(type: type, category_id: category_id)
    if !!dance_class && dance_class != self
    errors.add(:type, 'has already been added for that category')
    end
  end

  def title_category
    "#{title} - #{category.name}"
   end


   def category_attributes=(hash)
     category = Category.find_or_create_by(name: hash[:name])
     #push it into dance_class
     self.category = category
   end


end
