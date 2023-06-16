class AddFieldCvToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :curriculum_vitate, :string
  end
end
