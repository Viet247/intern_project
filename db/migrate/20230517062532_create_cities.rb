class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :category_value
      t.timestamps
    end
  end
end
