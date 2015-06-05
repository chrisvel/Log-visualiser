class CreateLogFiles < ActiveRecord::Migration
  def up
    create_table :log_files do |t|
      t.datetime    :init_date, null: false
      t.belongs_to  :user,      null: false
      t.timestamps null: false
    end
    
    add_index :log_files, [:user_id, :init_date]
  end
  
  def down
    drop_table :log_files
  end
end
