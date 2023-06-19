class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.string :full_name
      t.string :email
      t.string :cv
      t.timestamps
    end
    add_reference :applies, :job, index: true
    add_reference :applies, :user, index: true
  end
end
