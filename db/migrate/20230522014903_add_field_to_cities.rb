class AddFieldToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :job_count, :integer
  end
end
