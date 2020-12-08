class ApplicationController < ActionController::Base

    helper_method :current_dancer, :logged_in?, :create_session

    private

    def require_login
        redirect_to login_path unless session[:dancer_id]
    end

    def logged_in?
        session[:dancer_id] ? true : false
    end

    def current_dancer
         session[:dancer_id]
    end

    def create_session
        session[:dancer_id] = @dancer.id
      end

end
