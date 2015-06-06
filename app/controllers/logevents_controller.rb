class LogeventsController < ApplicationController
  # devise filter to authenticate user before calling controller
  before_filter :authenticate_user!
  
  def index
  end

  def new
    @logevent = LogEvent.new
  end

  def create
    @logevent = LogEvent.create(logevent_params)
    @user = current_user
    if @logevent.persisted?
      flash[:green] = "Log Event created!"
      redirect_to root_path
    else
      render root_path
    end
  end
  
  private
    def logevent_params
      params.require(:logevent).permit(
        :user_id,
        :install_date,
        :status,
        :package_name,
        :major_rel,
        :minor_rel,
        :elxxx,
        :platform
      )
    end
  
end
