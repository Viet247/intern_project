class CreateFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :favourites do |t|
      t.bigint :job_id
      t.bigint :user_id
      t.timestamps
    end
    add_index :favourites, [:job_id, :user_id], unique: true
  end
end
