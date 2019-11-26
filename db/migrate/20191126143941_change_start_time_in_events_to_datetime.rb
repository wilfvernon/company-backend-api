class ChangeStartTimeInEventsToDatetime < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :start_time
    add_column :events, :start_time, :datetime 
  end
end
