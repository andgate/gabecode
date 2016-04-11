class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  force_ssl if: logged_in?, unless: Rails.env.development?
  
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
        
        def force_ssl_for_user
          force_ssl if logged_in?
        end
        
        def force_ssl(options = {})
          host = options.delete(:host)
          unless request.ssl? or Rails.env.development?
            redirect_options = {:protocol => 'https://', :status => :moved_permanently}
            redirect_options.merge!(:host => host) if host
            flash.keep
            redirect_to redirect_options and return
          else
            redirect_options = {:protocol => 'http://', :status => :moved_permanently}
            redirect_options.merge!(:host => host) if host
            flash.keep
            redirect_to redirect_options and return
          end
        end
end
