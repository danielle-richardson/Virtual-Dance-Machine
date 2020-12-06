class DanceClassesController < ApplicationController

    def new 
        @dance_class = DanceClass.new
        @dance_class.build_category     

    end 

    def create 
        @dance_class = DanceClass.new(dance_class_params)
        @dance_class.dancer_id = session[:dancer_id]    
      if @dance_class.save                             
         redirect_to dance_class_path(@dance_class)
      else 
         render :new
      end
    end 

    def index
        @dance_classes = DanceClass
    end 

    private
      
    def dance_class_params
        params.require(:dance_class).permit(:type, :description, :category_id, category_attributes: [:name]) 
    end
end
