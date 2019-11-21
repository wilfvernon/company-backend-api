class CreateEventCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :event_characters do |t|
      t.integer :character_id
      t.integer :event_id
      t.boolean :organiser

      t.timestamps
    end
  end
end
