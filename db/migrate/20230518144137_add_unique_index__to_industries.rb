class AddUniqueIndexToIndustries < ActiveRecord::Migration[7.0]
  def change
    add_index :industries, :title, unique: true
  end
end
