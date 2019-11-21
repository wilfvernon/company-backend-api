class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :type
      t.string :image
      t.integer :minimum_level
      t.integer :minimum_ilevel

      t.timestamps
    end
  end
end
