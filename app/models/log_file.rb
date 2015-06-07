class LogFile < ActiveRecord::Base
  
  # Associations
  belongs_to :user, :foreign_key => 'user_id'
  
end
