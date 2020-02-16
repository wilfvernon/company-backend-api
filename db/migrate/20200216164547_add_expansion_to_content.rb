class AddExpansionToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :expansion, :string
  end
end
