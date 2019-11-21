class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :time
      t.string :location
      t.integer :community_id
      t.string :type

      t.timestamps
    end
  end
end
