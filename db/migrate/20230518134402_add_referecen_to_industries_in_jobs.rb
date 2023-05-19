class AddReferecenToIndustriesInJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :industries, index: true
  end
end
