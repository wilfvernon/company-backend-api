class CreateEventCharacterJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :event_character_jobs do |t|
      t.integer :job_id
      t.integer :event_character_id
      t.boolean :selected

      t.timestamps
    end
  end
end
