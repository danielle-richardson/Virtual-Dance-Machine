class DanceClassesController < ApplicationController
    before_action :set_dance_class, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in
    
    def new 
      @dance_class = DanceClass.new
      @dance_class.build_category     
    end 

    def create 
        @dance_class = DanceClass.new(dance_class_params)
        @dance_class.dancer_id = session[:dancer_id]    
      if @dance_class.save
        @dance_class.image.purge
        @dance_class.image.attach(params[:dance_class][:image])                             
         redirect_to dance_class_path(@dance_class)
      else 
        @dance_class.build_category
         render :new
      end
    end 

    def index
        @dance_classes = DanceClass.all
    end 

    def show
    end
  
    def edit
    end
  
    def update
      if @dance_class.update(dance_class_params)
        @dance_class.image.purge
        @dance_class.image.attach(params[:dance_class][:image])
        redirect_to dance_class_path(@dance_class)
      else
        render :edit
      end
    end

    private
      
    def dance_class_params
        params.require(:dance_class).permit(:description, :category_id, category_attributes: [:name]) 
    end

    def set_dance_class
        @dance_class = DanceClass.find_by(params[:id])
        redirect_to dance_classes_path if !@dance_class
    end
end
