class ApplicationController < ActionController::Base

    helper_method :current_dancer, :logged_in?, :create_session

    private

    def require_login
        redirect_to login_path unless session[:user_id]
    end

    def logged_in?
        !!session[:dancer_id]
    end

    def current_dancer
        @current_dancer ||= Dancer.find_by_id(session[:dancer_id]) if session[:dancer_id]
    end

    def create_session
        session[:dancer_id] = @dancer.id
      end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

end
