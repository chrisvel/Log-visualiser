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
      if @logfile_name.match(/^\w+.\w+-(.*)/)
        @logfile_date = Date.parse(@logfile_name.match(/^\w+.\w+-(.*)/)[1]).to_date.strftime('%b %d %Y')
      else 
        @logfile_date = Date.today.strftime('%b %d %Y')
      end
      
      # create the logfile before iterating file entries
      logfile = LogFile.create!(:init_date => @logfile_date, :user_id => current_user.id)
      
      # analyze file data
      logfile_path = params[:file].path
      File.foreach(logfile_path, headers: false) do |row|
        # split each row to whitespace
        @logdata = row.to_s.split
        # merge date values
        @install_date = DateTime.parse(@logdata[0] + " " + @logdata[1] + " " + @logdata[2]).to_datetime.strftime('%b %d %H:%M:%S')
        @status = @logdata[3].sub(/\:/, '')
        # slice the package name
        regex = /^[\d:]*((?:[a-z]+\w*-)+)(?:([\d\.]+)\.((?:\d+-\d+)(?:.*))\.(el[\w.]+)\.(.*)|(\d+)-(\d+)\.?(el[\w.]+)?\.(.*))/
        if @logdata[4].to_s.match(regex)
          @package_info =  @logdata[4].to_s.match(regex)
        
          @package_name = @package_info[1].gsub(/-/,' ')
          
          if @package_info[2]
            @major_rel = @package_info[2]
          else
            @major_rel = "-"
          end
      
          if @package_info[3] 
            @minor_rel = @package_info[3] 
          else
            @minor_rel = "-"
          end
          
          if @package_info[5]
            @platform = @package_info[5] 
          else
            @platform = "unknown"
          end

          @lines << [@install_date, @status, @package_name, @major_rel, @minor_rel, @platform]
          
          # save the log_events data
          logfile.log_events.create!(
              :install_date => @install_date,
              :status => @status,
              :package_name => @package_name,
              :major_rel => @major_rel,
              :minor_rel => @minor_rel,
              :elxxx => "",
              :platform => @platform,
              :user_id => current_user.id
              )
          
        end
      end
    end
  end
end
