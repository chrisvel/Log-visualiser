class HomeController < ApplicationController
  require 'csv'
  
  # devise filter to authenticate user before calling controller
  before_filter :authenticate_user!
  
  def index
    
  end
  
  def import_data
    @lines = Array.new
    @package_info = Array.new
    
    if !params[:file].nil?
      # analyze file name
      @logfile_name = params[:file].original_filename
      @logfile_date = Date.parse(@logfile_name.match(/^\w+.\w+-(.*)/)[1]).to_date.strftime('%b %d %Y')
      
      # analyze file data
      logfile_path = params[:file].path
      File.foreach(logfile_path, headers: false) do |row|
        # split each row to whitespace
        @logdata = row.to_s.split
        # merge date values
        @install_date = DateTime.parse(@logdata[0] + " " + @logdata[1] + " " + @logdata[2]).to_datetime.strftime('%b %d %H:%M:%S')
        @status = @logdata[3].sub(/\:/, '')
        # slice the package name
        regex = /^[\d:]*((?:\w+[\w\d]*-)+)(\d+)\.?([\d\.]*)(?:-(\d+)\.(\w+)\.?(\w+)?)*/
        if @logdata[4].to_s.match(regex)
          @package_info =  @logdata[4].to_s.match(regex)
        
          @package_name = @package_info[1].gsub(/-/,' ')
          @major_rel = @package_info[2]
          @minor_rel = @package_info[3] 
          @minor_rel += "-" + @package_info[4] if @package_info[4]
          @platform = @package_info[6] if @package_info[6]

          @lines << [@install_date, @status, @package_name, @major_rel, @minor_rel, @platform]
        end
      end
    end
    
    
  end
  
end
