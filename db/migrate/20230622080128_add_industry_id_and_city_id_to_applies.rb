class AddIndustryIdAndCityIdToApplies < ActiveRecord::Migration[7.0]
  def change
    add_column :applies, :city_id, :integer
    add_index :applies, :city_id
    add_column :applies, :industry_id, :integer
    add_index :applies, :industry_id
  end
end
