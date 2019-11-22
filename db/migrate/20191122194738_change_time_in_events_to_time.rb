class ChangeTimeInEventsToTime < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :time, :time
  end
end
