class AddColumnsToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :"contact_name", :string
  end
end
