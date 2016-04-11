class SessionsController < ApplicationController
  include SessionsHelper
  before_filter :force_ssl_for_user, only: [:new, :create]
  
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
end
