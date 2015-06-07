class LogEvent < ActiveRecord::Base
  enum status:   [ :Updated, :Installed, :Removed ]
  enum platform: [ :noarch, :x86_64, :i686, :unknown ]
  
  # accossiations
  belongs_to :user,   :foreign_key => 'user_id'
  belongs_to :log_file,   :foreign_key => 'logfile_id'
  accepts_nested_attributes_for :log_file, allow_destroy: true
  
  # validations
  
end
