class AddApiIdToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :api_id, :string
  end
end
