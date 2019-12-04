class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :icon
      t.string :role

      t.timestamps
    end
  end
end
