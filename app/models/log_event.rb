class LogEvent < ActiveRecord::Base
  enum status:   [ :Updated, :Installed, :Removed ]
  enum platform: [ :noarch, :x86_64, :i686, :unknown ]
  
  # accossiations
  belongs_to :user,   :foreign_key => 'user_id'
  
  # validations
  
end
