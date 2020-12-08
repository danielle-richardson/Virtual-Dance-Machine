class DanceClassesController < ApplicationController
    before_action :set_dance_class, only:[:show, :edit, :update, :destroy]
    before_action :require_login
    
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
      if params["/dance_classes"]
      @dance_classes = DanceClass.all
      @dance_classes = DanceClass.filter_by_type(params["/dance_classes"][:type])
      else
      @dance_classes = DanceClass.all
      end
    end 
 


    def show
      @comments = @dance_class.comments
    end
  
    def edit
      if session[:dancer_id] != @dance_class.dancer_id
        redirect_to dancer_path(session[:dancer_id])
      end 
    end
  
    def update
      if @dance_class.update(dance_class_params)
        redirect_to dance_classes_path
      else
        render :edit
      end
    end

    def destroy 
      if current_dancer != @dance_class.user_id
          redirect_to dancer_path(session[:dancer_id])
      else 
          @dance_class.destroy
          redirect_to dance_classses_path
      end
  end

    private
      
    def dance_class_params
        params.require(:dance_class).permit(:type, :description, category_attributes: [:name]) 
    end

    def set_dance_class
        @dance_class = DanceClass.find_by(params[:id])
    end
end
