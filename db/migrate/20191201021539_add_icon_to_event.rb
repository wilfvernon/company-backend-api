class AddIconToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :icon, :string
  end
end
