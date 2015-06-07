class AddLogfileIdToLogEvents < ActiveRecord::Migration
  
  def up
    add_reference :log_events, :log_file, index: true
  end
  
  def down
    remove_reference :log_events, :log_file
  end
  
end
