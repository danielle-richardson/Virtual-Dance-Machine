class CategoriesController < ApplicationController
    
  before_action :require_login


  def index
    @categories = Category.filter_duplicates
    dance_classes = DanceClass.all
  end

end
