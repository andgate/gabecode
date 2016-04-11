class SessionsController < ApplicationController
  include SessionsHelper
  force_ssl if: :ssl_configured?, only: [:new, :create]
  
  def new
  end
  
  def create
    if authenticate? params[:session][:password]
      log_in
      flash[:success] = "Logged in successfully!"
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid password'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  private 
    def ssl_configured?
      !Rails.env.development?
    end
end
