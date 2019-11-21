class CreateContentEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :content_events do |t|
      t.integer :content_id
      t.integer :event_id

      t.timestamps
    end
  end
end
