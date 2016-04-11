class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  force_ssl if: :ssl_configured_for_user?
  
  include SessionsHelper
  
  private
        # Confirms a logged-in user.
        def logged_in_user
          unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
          end
        end
        
        def ssl_configured_for_user?
          !Rails.env.development? && logged_in?
        end
        
        def force_http(options = {})
          if request.ssl? && Rails.env.production?
            redirect_to :protocol => 'http://', :status => :moved_permanently
          end
        end
end
