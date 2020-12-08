class SessionsController < ApplicationController

  def new
    @dancer = Dancer.new 
  end 

  def create
    if params[:provider] == 'google_oauth2'
      @dancer = Dancer.create_by_google_omniauth(auth)
      create_session
      redirect_to dancer_path(@dancer)

    else 
     #try to find dancer in the database
     @dancer = Dancer.find_by(username: params[:dancer][:username])

    
     #did we find someone & did they put in the right pw
      if @dancer && @dancer.authenticate(params[:dancer][:password])
      create_session
      redirect_to dancer_path(@dancer)
      else
        flash[:error] = "Sorry, log info was incorrect. Please try again."
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
