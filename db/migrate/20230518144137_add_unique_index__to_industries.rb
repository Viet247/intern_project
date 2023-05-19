class AddUniqueIndexToIndustries < ActiveRecord::Migration[7.0]
  def change
    add_index :industries, :category, unique: true
  end
end
