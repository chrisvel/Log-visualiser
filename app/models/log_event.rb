class LogEvent < ActiveRecord::Base
  enum status:   [ :update, :install, :remove ]
  enum platform: [ :noarch, :x86_64, :i686 ]
  
end
