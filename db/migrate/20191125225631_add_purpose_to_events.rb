class AddPurposeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :purpose, :string
  end
end
