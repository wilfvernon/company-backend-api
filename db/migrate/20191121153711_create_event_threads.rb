class CreateEventThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :event_threads do |t|
      t.integer :character_id
      t.integer :event_id
      t.string :title
      t.string :flair

      t.timestamps
    end
  end
end
