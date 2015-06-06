class HomeController < ApplicationController
  require 'csv'
  
  # devise filter to authenticate user before calling controller
  before_filter :authenticate_user!
  
  def index
    
  end
  
  def import_data
    @lines = Array.new
    if !params[:file].nil?
      logfile_path = params[:file].path
      File.foreach(logfile_path, headers: false) do |row|
        @lines << row.to_s.split.to_a
      end
    end
  end
  
end
