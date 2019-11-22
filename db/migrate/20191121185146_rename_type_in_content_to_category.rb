class RenameTypeInContentToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :contents, :type, :category
  end
end
