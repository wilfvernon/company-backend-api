class AddApiIdToContents < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :api_id, :string
  end
end
