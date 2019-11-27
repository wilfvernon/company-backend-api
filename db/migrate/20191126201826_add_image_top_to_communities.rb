class AddImageTopToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :image_top, :string
  end
end
