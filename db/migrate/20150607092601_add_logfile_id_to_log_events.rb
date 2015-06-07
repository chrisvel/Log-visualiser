class AddLogfileIdToLogEvents < ActiveRecord::Migration
  
  def up
    add_reference :log_events, :logfile, index: true
  end
  
  def down
    remove_reference :log_events, :logfile
  end
  
end
