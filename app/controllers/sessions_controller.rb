class SessionsController < ApplicationController

    def welcome
    end 

    def new
    end 

    def create 
        #finds the dancer in the database
        Dancer.find_by(username: params[:dancer][:username])
        #did we find someone & did they put in the right pw
        if @dancer.try(:authenticate, params[:dancer][:password])
        session[:dancer_id] = @dancer.id
        redirect_to dancer_path(@dancer)
        else
         flash[:error] = "Sorry, your username and/or password was incorrect. Please try again."
            redirect_to login_path
        end

    end 

    def destroy
        session.delete(:dancer_id)
        redirect_to '/' 
    end 
end
