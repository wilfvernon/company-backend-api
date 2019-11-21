class CreateEventPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :event_posts do |t|
      t.integer :character_id
      t.integer :event_thread_id
      t.string :text

      t.timestamps
    end
  end
end
