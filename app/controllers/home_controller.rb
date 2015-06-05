class HomeController < ApplicationController
  require 'csv'
  
  # devise filter to authenticate user before calling controller
  before_filter :authenticate_user!
  
  def index
  end
  
  def import
    fileText = File.read(params[:file].path)
    fileData = CSV.parse(fileText, headers: false)
    fileData.each do |row|
      puts row
    end

    redirect_to root_path, notice: "Data imported."
  end
  
end
