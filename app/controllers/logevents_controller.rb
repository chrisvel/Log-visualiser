class LogeventsController < ApplicationController
  # devise filter to authenticate user before calling controller
  before_filter :authenticate_user!
  
  def index
    @logevents = LogEvent.all.order(package_name: :asc)
    @logevents_datetime = @logevents.group_by(&:install_date)
    @logevents_status = @logevents.group_by(&:status)
    @logevents_pname = @logevents.group_by(&:package_name)
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
  
  def search
  end
  
  def search_results
    @user = current_user
    if params[:search_text].present?
      @logevents = LogEvent.where("package_name LIKE ?", "%#{params[:search_text]}%").order(package_name: :asc)
      
    else
      @logevents = LogEvent.all.order(package_name: :asc)
    end
      @logevents_pname = @logevents.group_by(&:package_name)
  end

  def visualise
  end

  def visualise_chart
    if params[:from_date].present? && params[:to_date].present?
      from_date = Date.parse("#{params[:from_date]}")
      end_date = Date.parse("#{params[:to_date]}")
      @logevents = LogEvent
        .where(install_date: from_date..end_date)
        .order(package_name: :asc)
    else
      @logevents = LogEvent.all.order(package_name: :asc)
    end
  @logevents_updated = @logevents.where(status: 0).count
  @logevents_installed = @logevents.where(status: 1).count
  @logevents_removed = @logevents.where(status: 2).count
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
