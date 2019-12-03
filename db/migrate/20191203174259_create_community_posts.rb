class CreateCommunityPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :community_posts do |t|
      t.integer :character_id
      t.integer :community_thread_id
      t.string :text

      t.timestamps
    end
  end
end
