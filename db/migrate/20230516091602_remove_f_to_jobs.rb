class RemoveFToJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :requirement, :string
    add_column :jobs, :requirement, :text
  end
end
