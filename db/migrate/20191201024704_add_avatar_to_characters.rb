class AddAvatarToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :avatar, :string
  end
end
