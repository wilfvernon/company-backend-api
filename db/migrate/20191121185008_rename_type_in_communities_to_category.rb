class RenameTypeInCommunitiesToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :communities, :type, :category
  end
end
