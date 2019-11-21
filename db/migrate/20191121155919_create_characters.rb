class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :account_id
      t.string :profile_image
      t.string :server
      t.boolean :primary

      t.timestamps
    end
  end
end
