class LogFile < ActiveRecord::Base
  
  # Associations
  belongs_to :user, :foreign_key => 'user_id'
  has_many :log_events
  
  
end
