class AddColumnToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :description, :text
  end
end
