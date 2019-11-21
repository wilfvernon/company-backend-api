class CreateCommunityCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :community_characters do |t|
      t.integer :community_id
      t.integer :character_id
      t.string :role

      t.timestamps
    end
  end
end
