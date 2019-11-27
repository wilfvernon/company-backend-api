class AddImageBaseToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :image_base, :string
  end
end
