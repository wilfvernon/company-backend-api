class RenameTimeInEventsToStartTime < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :time, :start_time
  end
end
