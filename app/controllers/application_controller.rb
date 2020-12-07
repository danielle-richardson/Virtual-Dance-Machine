class ApplicationController < ActionController::Base

    helper_method :current_dancer, :logged_in?

    private

    def logged_in?
        !!session[:user_id]
    end

    def current_dancer
        @current_dancer ||= Dancer.find_by_id(session[:dancer_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

end
