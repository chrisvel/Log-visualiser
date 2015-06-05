class HomeController < ApplicationController
  
  # devise filter to authenticate user before calling controller
  before_filter :authenticate_user!
  
  def index
  end
  
end
