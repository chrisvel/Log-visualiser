class LogEvent < ActiveRecord::Base
  enum status:   [ :Updated, :Installed, :Removed ]
  enum platform: [ :noarch, :x86_64, :i686, :unknown ]
  
  serialize :things
  
  # validations
  
  
  
end
