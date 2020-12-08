class SessionsController < ApplicationController

  def new
    @dancer = Dancer.new 
  end 

  def create
    @dancer = Dancer.find_by(username: params[:dancer][:username])
    if @dancer && @dancer.authenticate(params[:dancer][:password])
        create_session
        redirect_to dancer_path(@dancer)
    else
        render :new
    end
  end

    def destroy
      session.delete(:dancer_id)
      flash[:notice] = "You have successfully logged out."
      redirect_to '/' 
    end 

    def omniauth
        @dancer = Dancer.create_by_google_omniauth(auth)
      if @dancer
        create_session
        redirect_to dancer_path(@dancer)
      else 
        redirect_to login_path
      end 
    end 
    
    private
    
    def auth
        request.env['omniauth.auth']
    end
    
    
end
