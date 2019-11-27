class AddImageMidToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :image_mid, :string
  end
end
