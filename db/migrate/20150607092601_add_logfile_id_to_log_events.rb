class AddLogfileIdToLogEvents < ActiveRecord::Migration
  
  def up
    add_reference :logevents, :logfile_id, index: true
  end
  
  def down
    remove_reference :logevents, :logfile_id
  end
  
end
