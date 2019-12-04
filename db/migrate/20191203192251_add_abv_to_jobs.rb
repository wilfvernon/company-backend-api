class AddAbvToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :abv, :string
  end
end
