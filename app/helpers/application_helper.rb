module ApplicationHelper
    
    def render_nav_bar
        if logged_in?
          render partial: 'layouts/loggedin_links'
        else
          render partial: 'layouts/loggedout_links'
        end
      end
end
