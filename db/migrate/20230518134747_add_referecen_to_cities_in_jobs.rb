class AddReferecenToCitiesInJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :cities, index: true
  end
end
