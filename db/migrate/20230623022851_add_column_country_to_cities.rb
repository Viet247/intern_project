class AddColumnCountryToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :country, :string, default: "Viet Nam"
  end
end
