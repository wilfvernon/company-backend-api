class AddApiIdToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :api_id, :string
  end
end
