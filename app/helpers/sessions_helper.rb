module SessionsHelper
    # Returns true is the given password is correct
    def authenticate?(password)
        ENV['PASS_HASH'] == BCrypt::Engine.hash_secret(password, ENV['PASS_SALT'])
    end
    
    # Logs in the given user.
    def log_in
        session[:logged_in] = true
    end
    
    def log_out
        session.delete(:logged_in)
    end
    
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        session[:logged_in]
    end
    
    def redirect_back_or(default)
        redirect_to(session[:return_to] || default)
        session.delete(:return_to)
    end
    
    def store_location
        session[:return_to] = request.url
    end
end
