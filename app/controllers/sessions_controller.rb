class SessionsController < ApplicationController

  def welcome
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
      @dancer = Dancer.find_by(username: params[:dancer][:username])

    if @dancer && @dancer.authenticate(params[:dancer][:password])
      session[:dancer_id] = @dancer.id
        redirect_to dancer_path(@dancer)
    else
      flash[:error] = "Sorry, your username and/or password was incorrect. Please try again."
        redirect_to login_path
      end
    end

  end 

    def destroy
      session.delete(:dancer_id)
      flash[:notice] = "You have successfully logged out."
      redirect_to '/' 
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
