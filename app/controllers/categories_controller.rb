class CategoriesController < ApplicationController
    
  before_action :redirect_if_not_logged_in


    def index
      @categories = Category.alpha
    end
end
