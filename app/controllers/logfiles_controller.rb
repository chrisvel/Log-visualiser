class LogfilesController < ApplicationController
  
  def new
    @logfile = LogFile.new
  end

  def create
    @logfile = current_user.logfiles.create(logfile_params)
    @user = current_user
    if @logfile.persisted?
      flash[:green] = "Log File created!"
    else
      flash[:red] = "Log File failed to create!"
    end
  end
  
  private
    def logfile_params
      params.require(:logfile).permit(
        :init_date,
        :user_id
      )
    end
  
end
