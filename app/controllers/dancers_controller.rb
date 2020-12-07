class DancersController < ApplicationController

    def new
    end 

    def create
        @dancer = Dancer.new(dancer_params)      
        if @dancer.save                             
            session[:dancer_id] = @dancer.id
            redirect_to dancer_path(@dancer)
        else 
            render :new
        end
    end

    def show 
        redirect_if_not_logged_in
        @dancer = Dancer.find_by_id(params[:id])    
        redirect_to ‘/’ if !@dancer   
    end

    private 

    def dancer_params
        params.require(:dancer).permit(:username, :email, :password)   
    end 

end 

