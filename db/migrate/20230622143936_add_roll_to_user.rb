class AddRollToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, default: fa
  end
end
