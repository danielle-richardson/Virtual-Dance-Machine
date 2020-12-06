class ApplicationController < ActionController::Base

    private
    def current_dancer
    @current_dancer ||= Dancer.find_by_id(session[:dancer_id])
    end

end
