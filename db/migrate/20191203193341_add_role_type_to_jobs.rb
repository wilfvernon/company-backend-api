class AddRoleTypeToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :role_type, :string
  end
end
