class AddUniqueIndexToCities < ActiveRecord::Migration[7.0]
  def change
    add_index :cities, :city_name, unique: true
  end
end
