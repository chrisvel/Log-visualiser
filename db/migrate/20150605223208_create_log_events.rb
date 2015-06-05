class CreateLogEvents < ActiveRecord::Migration
  def up
    create_table :log_events do |t|
      t.datetime    :install_date, null: false
      t.integer     :status,       null: false
      t.string      :package_name, null: false
      t.integer     :major_rel,    null: false
      t.string      :minor_rel,    null: false
      t.string      :elxxx,        null: false
      t.integer     :platform,     null: false
      t.belongs_to  :user,         null: false
      t.timestamps null: false
    end
    
    add_index :log_events, [:user_id, :package_name, :install_date]
  end
  
  def down
    drop_table :log_events
  end
end
