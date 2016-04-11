class StaticPagesController < ApplicationController
  before_filter :force_http
  
  def home
  end

  def resume
  end

  def contact
  end
end
