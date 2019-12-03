class CreateCommunityThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :community_threads do |t|
      t.integer :character_id
      t.integer :community_id
      t.string :title
      t.string :flair

      t.timestamps
    end
  end
end
