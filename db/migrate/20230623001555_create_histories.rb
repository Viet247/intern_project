class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.bigint :job_id
      t.string :user_id
      t.timestamps
    end

    add_index :histories, [:job_id, :user_id], unique: true
  end
end


