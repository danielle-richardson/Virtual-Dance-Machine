class SessionsController < ApplicationController

    def welcome
    end 

    def destroy
        session.delete(:dancer_id)
        redirect_to '/' 
    end 

    def new
    end 

    def create 
        if params[:provider] == 'google_oauth2'
            @dancer = Dancer.create_by_google_omniauth(auth)
            session[:dancer_id] = @dancer.id
            redirect_to dancer_path(@dancer)
      
          elsif params[:provider] == 'github'
            @dancer = Dancer.create_by_github_omniauth(auth)
            session[:dancer_id] = @dancer.id
            redirect_to dancer_path(@dancer)
          else
            #finds the dancer in the database
            @dancer = Dancer.find_by(username: params[:dancer][:username])


        #did we find someone & did they put in the right pw
        if @dancer.try(:authenticate, params[:dancer][:password])
        session[:dancer_id] = @dancer.id
        redirect_to dancer_path(@dancer)
        else
         flash[:error] = "Sorry, your username and/or password was incorrect. Please try again."
            redirect_to login_path
        end
      end

    end 

    def omniauth
        @dancer = Dancer.create_by_google_omniauth(auth)
    
        session[:dancer_id] = @dancer.id
        redirect_to dancer_path(@dancer)
    end
    
    private
    
    def auth
        request.env['omniauth.auth']
    end
    
    
end
