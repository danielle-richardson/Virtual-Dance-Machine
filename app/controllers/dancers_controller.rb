class DancersController < ApplicationController

    def new
        @dancer = Dancer.new
    end 

    def index
        @dancers = Dancer.all
    end

    def create
        @dancer = Dancer.new(dancer_params)      
        if @dancer.save                             
            create_session
            redirect_to dancer_path(@dancer)
        else 
            render :new
        end
    end

    def show 
        @dancer = Dancer.find_by_id(params[:id])    
    end

    private 

    def dancer_params
        params.require(:dancer).permit(:username, :email, :password)   
    end 

end 

