class AddLogfileIdToLogEvents < ActiveRecord::Migration
  
  def up
    add_reference :log_events, :logfile_id, index: true
  end
  
  def down
    remove_reference :log_events, :logfile_id
  end
  
end
