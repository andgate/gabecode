module SessionsHelper
    def authenticate?(password)
        ENV['PASS_HASH'] == BCrypt::Engine.hash_secret(password, ENV['PASS_SALT'])
    end
end
