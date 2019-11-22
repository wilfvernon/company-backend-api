class RenameTypeInEventToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :type, :category
  end
end
