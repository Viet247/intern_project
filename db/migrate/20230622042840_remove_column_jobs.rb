class RemoveColumnJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :cities_id
    remove_column :jobs, :industries_id
  end
end
