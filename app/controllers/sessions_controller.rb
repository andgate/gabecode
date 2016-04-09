class SessionsController < ApplicationController
  def new
  end
  
  def create
    if authenticate?(params[:session][:password])
      # create a new session
      redirect_to root_path
    else
      # spit out error message
      render 'new'
    end
  end
  
  def destroy
  end
end
