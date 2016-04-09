class SessionsController < ApplicationController
  def new
  end
  
  def create
    if false # password is valid
      # create a new session
    else
      # spit out error message
      render 'new'
    end
  end
  
  def destroy
  end
end
